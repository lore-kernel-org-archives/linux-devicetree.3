Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956640;
	b=bu2gXNUuIw7oBXAAAksm9p+lpaBsdCt3YGf7qW0wpzIH2tR1F/Xel/+51RczZv5dNKQ9
	 vC/hWwxkC4bLjukzODSRgYaXYA7EVCOvRnVBaW08Hm6OB1j1VfElHZSBxeTFoBN2nhZFR
	 aGpASS/Z/P01g6atPxqPy1+0gFNtu3qZr4P8zMtdowKLQL3sEoA9k45IhlKuBFsN41Kbw
	 bPj+VTITU4fZB3k4hIr7n2s/zIGHdPc4co1LccuQh0lq6uBQdsSZBpV2wSQ0DV8HBmXwL
	 jVvY3us4BD+OJ6eyEOKNqEmyWcYA0KcwIQGX7JLoM6+U/QROFMHPsnaO5ST5BEeqQBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QV5hhgwDtQTt5SAYfrerd7IkI7JI7kVQtItIdeKT6D4=;
	b=krcvj+ktbkO+H9gFGZjwy0qtaFL5iDUH7MLDHfDqOKVJozv7beILYwsuDgX4M6ge+gOq
	 wnrTgEg245aShEBB8wfR5d4RHAYn2dc6fer4/tOw6Kvd9hzICu3p1B1sRo1g+8//oUDgy
	 +dR0LE4lbTnrTnZCPzOVXQkbSLI23AcnS3pEZFjUJ8zoHPoNBkeizzq2ZqH7qyycgJPHt
	 5Rmbos3yY+wsimbHneysbh51Hjwcy5x4U7Xf8efTV1Z3+rkfvnW1QRsoaBCkzxWf2DVeh
	 Lfl5s+IVUEIcnkeORHrN6968gJhPkHPIagkT1WrIGf2e8KXHUm54OsfKiT2rZcf9Epg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edHJqB3a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OZ10vZkc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1551F606A339
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1551F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edHJqB3a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OZ10vZkc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R9LC2333811
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 09:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QV5hhgwDtQTt5SAYfrerd7Ik
	I7JI7kVQtItIdeKT6D4=; b=edHJqB3aL3fPedwRbjfz/LmF1f33hPVcRqgR6F3v
	cMqwNkwgetZYNJAoQA1H/6E5t7YcJZW+c49T7vw5m+khdhzRTCEn5bXJ9yK7BYLb
	oyiP0rMEtHtJGfEmA0Im5mN+N72Beyp+/2mInQoIahf6x/04P6tPS/jXmyv+UkEC
	m+uMECtgiQJ6Xn3cSivZ/c+Sn1JDIPXDAMe8HeQbyPrbxSg4CyIS95pYZhbsu8q4
	3ZgHze5AOq3O/NE2Zk0x53NbbTEDBYDMpPWPqDDZPNjS1G5XYvg02g5cX76MCA2g
	6O6vXAidFv91H9vwe28bHAkgFVO0gi1uhEnuNZ6Wapj2Og==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9a51y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:17:19 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25d977b91so896653c88.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956639; x=1794561439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QV5hhgwDtQTt5SAYfrerd7IkI7JI7kVQtItIdeKT6D4=;
        b=OZ10vZkcn2F0t79mC5/mvYLp5oWZEfPQlsqx9P2Pw78rOnNWU//Soh639SrW3p3I5m
         jHMSF/m66OV53+lVLT1B+KobtT4PXd5uX4KRTWHSxqGeI6UevsHUt5flL42ccqQa1635
         2/mtIfNApDshB0RcKaKMD3pB5tpQPDw1aK03oRILWhnlVbTalu8eRG6bTvinrljXG6Cn
         tUx7nXv2F2W/caGpfZU6qWie4Zg+yhI4aZ4AsYZefJU7SFmFmD8MAcivuUAgwxzHccyD
         4JuHJ0TH0wkhCw+zv/d//js4WaM4fPQyGwe/ScmjPWTTpbLH0wagNxM/2Peoe680oRNB
         YujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956639; x=1794561439;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV5hhgwDtQTt5SAYfrerd7IkI7JI7kVQtItIdeKT6D4=;
        b=sXYA25ApKw6HZYW/JN6VA6EV91+oNo3ofwynvwkN97MscvVK5ub2/e/79YAZVO5OE8
         rkMgnz51VB5E8CLz+qmblEETU2cluu8zZ0adcxZWpvjkgBCF2RHvbKtOWVI3/QEX3goF
         eQ+IIv7/TC04B0IHYpwcM1DTn8oitqU2mRks2BaV/gbZgcZmDw68ZNwO9CtFQOVMqRpJ
         22FM5P68nljo+l/Scb18QIDBv1MYi6iEJu+To2jHW+9II7mCrfgSNAKanLkY93Ve/Scd
         uAEFN2AWLOML9xsyvhikwhLZaBTHVFDh4q5AMlQa5hnVPghZNX0p9HyvuMs+SJxL6Sg3
         pTNw==
X-Forwarded-Encrypted: i=1; AKwUvBwGZPu51aHekGt8wCLsw2bA4zogQ/Nmie+/McERq8l9ZVcxB/yaVRnPv1kjECWnTnjFPFAa2JncTg7+@vger.kernel.org
X-Gm-Message-State: APuU4Z8vvNt1f4nXdL5pwUmUSdMgmbJegCpJnk8j8QXd1R7FCH/15skM
	J/3uuR5Q4b8x96/7wTbmxhT3HlkeWgoBLbjngqexm1OyDTS3eyO9ztFLIYWhMSDlQ9BRiFlxkUg
	6+p50H21Oqs9oLI47Bcc4s22cz0X3L1sEaoQxLXl/pWOsnlu7zep8E8Tp+7fwgI8u
X-Gm-Gg: AYBFou2L6dJcwSUjCIAD5cofS8qHkgvSznk6dFkFxi6w/vXbBiKEDLIDhZBxfC68Okk
	hdN5Ap0JHgWqxsswENA3bqMtiutqi56O+jDfcl1As721uJ3JIlSIqI0fJFzihvlYTe/uSeZcsxz
	UNcimx7G0EDOHueDEZ/ul/c0SCDY9F09EXrXyNy6xB6iIZwzffjEGKK9+02/yWS7w+4lsdwF1vy
	OnL+PLR1n8x8RKi5VK4BNGnqvSg5XYmCC/tNXGz8alKI3A8tXXrhNsIbCA6TVhmNGCyg00nvpXy
	a1AQ0ANBRX6dHCrvUqKSq91RTK9lsLtUFR3BzfWwCuXJxErsRjCcoPi3bNGUfftp/9+4O1HZXVN
	64wQuwYtOkjA6ew/7jG6DpgNUmaZalAvQvq7TbRlyNaFT1GZQEvUUPLq70eC5Kz/AF2eODHtHHb
	5Ebc/dgt3mlzFtMrVJXRwufXwIOzUOXiCpxmf3yq7jkssDfwIUCB5JitNJXvBZYUvlJvOhuagis
	+4tDA==
X-Received: by 2002:a05:701b:2041:10b0:184:19ee:1fdd with SMTP id a92af1059eb24-1b25d28c0f3mr2485665c88.5.1793956638610;
        Fri, 06 Nov 2026 01:17:18 -0800 (PST)
X-Received: by 2002:a05:701b:2041:10b0:184:19ee:1fdd with SMTP id a92af1059eb24-1b25d28c0f3mr2485548c88.5.1793956636231;
        Fri, 06 Nov 2026 01:17:16 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e261962sm6603403c88.0.2026.11.06.01.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:17:15 -0800 (PST)
Date: Fri, 6 Nov 2026 14:47:09 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-cpufreq-nvmem: Simplify
 bindings
Message-ID: <au2bFZv+KW626iEs@hu-varada-blr.qualcomm.com>
References: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _2Exrwr8RCdQE75W4R2rjkXI68fUVxcE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfX673Ae9c1cyyV
 S15xvPK+qzKObxfUg4Su2wxJc9+VllQFcsDzkJL2Up7olHfDuPyAUI0vrYVHMI291eskyFgMS39
 1+nd7pjNvBFn3j0BF+eVgnrlWIO5cNX8eq63YINZEgWWKSFV1YWPvI4VjoX5FDqi+8J3kcvzLlZ
 2i86lJu68JmpYRjl5+0Ifq5Buqe+imEGXTnNCBHRvNX0c+gRx60iq1FtrhuAF7lgtICdo9TNg5A
 yjf6SPzu8dqHWLXCUMqrZu5zuxoji9W8suy47Z5S1BO8fdBcaaR6OfTXNyrgymkKMx6PJ/n8QXE
 lq15FpAvnw29iQ/tq6lBbF2YSXAf42TI3Yt7wylltKsGkigKQGz7juFbeXFf62fRZTNcmZfvk0S
 0sY5GU1cD1eXGtvTi4faDNiTKsyOYQLvUGgSnF2utpPCeQEW0uJ72r+ACgwM+6eIJaNme38ydmu
 QybAlsxmLTuguNacDPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfX8v81w/yjIrdd
 uhMZLaF80MOHcgRJQqRpO2TRZqqANCmegYVopVzy20Zuljkoe8OofIcgniMocsKscBtm+aWbcYd
 71FoQIKDp5wzC8WVSouGOzvP92qlZn8=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed9b1f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cSl9Pj24hSJcTmzJFjQA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: _2Exrwr8RCdQE75W4R2rjkXI68fUVxcE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060036

On Thu, Nov 05, 2026 at 08:46:07PM +0100, Krzysztof Kozlowski wrote:
> This binding selects a few top-level compatible machines, but since
> commit 389de9c5a677 ("dt-bindings: cpufreq: qcom-cpufreq-nvmem: make cpr
> bindings optional") only qcom,qcs404 is present in  "if:then:" clause
> which enforces specific OPP properties.
>
> For all other machines, this is a no-op, because there is no schema here
> enforcing a specific compatible for OPP nodes or any of OPP table
> properties: one can switch to standard OPP table (operating-points-v2)
> and this binding will not complain.
>
> OTOH, this binding has complicated "if:then:" blocks so is not easy to
> maintain and causes false positives when regular OPP table is
> encountered in matched machines.
>
> Drop all machines except QCS404 and move the subschema to top-level.
>
> Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks. With this change don't get the [1] error.

-Varada

1 - https://lore.kernel.org/linux-arm-msm/athPyI5nvYG4vmfl@hu-varada-blr.qualcomm.com/

