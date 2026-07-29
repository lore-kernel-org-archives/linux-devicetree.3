Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAF1484240
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328191; cv=none; b=FoXiNeYlgZaS+Y/PAx4sEUeboK7spNGlllwNo31Sl3sORrThnlUI28BKlmfAuW6qRODK1UwhO8CYRH53ANw5L4ei+18zLMTMvEnVxa7A+d/I176s2z7v5ULNhEpaqhfxQb+pOsyTOtKLFa4vG9SZ/4mDVsDADCyShPSrMGOq0I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328191; c=relaxed/simple;
	bh=eU3rIagD/DJkspdzzDXpQLbCoAx9UdH+KUAOnRqLvQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXYFZJyqVRjVJ4+1yDPA8bKKG3QI2usy/n5HHmK6zClqjIkltrM5FxNX02IaAwgKG31qXYzlEis61umoV6Yv95RqdnAT2NBlms0eY6ez4JFR8+fPxrmgkYGnI7npnbzh1xdV2vg9D8LUEVfzjD/L3+GRb/+YmoAF7UJ3x2Y11Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5zwqaXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jl2q0GQ7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5zwqaXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jl2q0GQ7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBXWt91218114
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xP3ywTkDvhhxUcM07PGoh5VmOojNwTFiUi/voo4w34o=; b=R5zwqaXsVQskLj4h
	cPx8jKeFWgDQkG8+6lQkJbuYaN7v5nkUmN+stni7jjCyKbve85qqHhfgwlUdW4Hx
	Hr3owy5LP8SfPElGTtoT3VLrBhDNrHIrgX1iWtzXwIZlvHj8GSNKWKjpSDc89q+5
	Huak3p5J8nZV8s6+1raiWwHphhhYxHv3mCSW7dnkreOODRqYTPv/fSJz/j9c7ycb
	WTUTKGyTErt1OsfESHkGtFS0nk76YJU5aOn4Uuf+3DBht2txoanqqUXlO5VXrnn4
	ssQqVD2TQuJp6jkMQOa0hqgK5Ecujighw2NljBSoAh0e9GTI36Dwzkbw7JUrALLX
	6VdfvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj079g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:29:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9d953b71so1331481cf.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785328185; x=1785932985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xP3ywTkDvhhxUcM07PGoh5VmOojNwTFiUi/voo4w34o=;
        b=Jl2q0GQ7ztfNDmD1lrTWrj8/CfZnjEPlOSUg9PlG5vikD8k3EeThvrEodA0H2AsXUq
         rlR7b5nvi+iTRN4QblpW4sHq9kLzBkShSqK6KrIjgQFdtvuYyQRRRzeZsJzdsdmhg2F9
         yLmlwXhkHjEblwRcS459eZs0l8De8V3TuLQ0f0EPkquRs6q9uUn/Q/ILgxasJmgpFseQ
         CikwHqxViAGZHAflXa4F+t2wYJisPwJCoz4Up6IATLOtsz+Do0X9sMLcfy/bJ7g2ghAj
         lDNtJq/pLrUdWokrTq65pa84AksFPd2DJxb4tw0x2X301/vbNKG/yKshd8ANHsTOIlII
         UAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328185; x=1785932985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xP3ywTkDvhhxUcM07PGoh5VmOojNwTFiUi/voo4w34o=;
        b=GDvveB6m0Jw9wiB7xZRih4pQeVvhH29uxUEZvMl4q/zwAWsS6eICgvNOjAMjNM+4UP
         zCMDMBjRtGVvr4phmm091boxBV1rKvynJNRTwzQsrpcViwcoYoIDkLX9R0PLcMZlqZ8W
         M+PoSShYSy3+AbyYyx6OzZXxBdO1Y8FjCkkD9iEZveYT6UP7ve+JlEvax0giT/hFJu9Y
         lgcFPeSgfFWZ5jR/pPE4zwiCVrA/szKJyaQtbnFsWRWfwJAVpRNJqEvhNgzTWfmGDhNy
         B4hSNa+dGTF9dUbfbmjvFhiso1u1sUGiSosnbw6/5XA030uuEruDa35JpaoE8qbXtwoz
         sb2Q==
X-Forwarded-Encrypted: i=1; AHgh+Roj45fqLQuY3p7+1P604/xr2MPb/V4KjjfR6NNwvOJMF/W5uvaxaEvzU4iu5sULv3CcFHT+JECbGnTp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa1fK2/nnlKwTaK1bNLwaweRT4afo45kFluT0aYV5mqoCGUuF1
	cKB+qsBYd8IgFNP70Z1sTfiYhkpcLbL93e8K3FuFVh+NqM6iC4fsd2IoTZjuXAcMBgNR8qurZcg
	gVQEr4jPW6A/6AU4BSxVhb3iE8zzdeh8EgBDZoIdkBa1rXiAnQ8EqF1c+PMzNqOEl
X-Gm-Gg: AR+sD10UVlU2u/OXWmbE4j30NiBiLWGAKgEAc0Ox2G/UhrcLoIiSLiIyODbiN+eqfbl
	tKuC3Zo4LnkMwzq1SrKkPhQcHHjYQGVhJ98AJRnpS3CDp0qmGNG+0MrIyeglukMfMkP0NLW6PcT
	B5DNwU9ZwDEpgZhHFx+dW6QuteZ3fC0J0VR7YYojwyQA1UEYeMvLamUZhbywmzMONGqR4XXmLNd
	T1dVnJk7IBsKvrVwdZBEXf07SoFdQUNq6b6QwQxO7bpaHRk4SQwUCkFrzyA4dsVKpO1QUGSKUnL
	o54QkfRRjm/khfgFQ3Vu9306xKsyQGVdenjCRc++/85bLqGZofb6MzmVKZK3o2zEsNdOZYyJcuj
	lXsvFf2Fr59Ibxldq4DHQN0+i
X-Received: by 2002:a05:620a:469e:b0:92e:5ef1:9072 with SMTP id af79cd13be357-93302679f1amr590484385a.2.1785328184534;
        Wed, 29 Jul 2026 05:29:44 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:92e:5ef1:9072 with SMTP id af79cd13be357-93302679f1amr590478085a.2.1785328183945;
        Wed, 29 Jul 2026 05:29:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f8f981705sm53805166b.9.2026.07.29.05.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:29:43 -0700 (PDT)
Message-ID: <95c33eec-8eec-4d01-b0f0-1ae33ebb0bd9@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:29:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: kodiak: mark PCIe root port as
 bridge
To: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
References: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
 <20260727-rb3-industrial-bt-uart-v2-5-2d100f30e202@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-rb3-industrial-bt-uart-v2-5-2d100f30e202@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a69f239 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fipHztts28RoyCzfkYEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: HsM7CvXLHP-2RaJ62yxBIxejrDavJHpb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMyBTYWx0ZWRfX8nVbWyHz5SQA
 MqbX3B2t577q8ombbvRGwSDTPXQw1lU9Nv1w5E1NDEeOjQu0XRMlF+wgfkn4zJHEAj8YXB3xK9B
 2BgVIhdYEUv8G5SBXi9S/PYpyIddP4MdAiJtNjtmqWFk6S8qvwWchwuRr7L1LSRxy3NNDSvU5Gr
 13Angd5juI3e663DA5UVA1Jvd3MeQkwllzPeH3dc8WD4sti4qhiLFkEudlwOiTdXwLPbNjcGPF2
 FfaeVOuskubhcFb9wTERfL7PzzTDdsSym1GmkQtncntTP1/H+s8EDHTjOqJo5wkSbB4V9uz6ctK
 PF7/nPQ8xKQTxnmEQItpUM7qCje1NwDlKY3wQiIJzkcgDC9oaTM+PuKZHRffGdxjdOqdFknLADC
 TmYPv9NoQY60qTdb+1HXUjKCQPhSphevMEHf0+pW9cAzw89d0lVgzs0wiA8gmvG4KRkWV9flcN+
 XJW40eig7y80gAlaRHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMyBTYWx0ZWRfX6BR9mLzEo0op
 lBUNtBzmkVsLSytXdzyRdwExK1DJu6nLj8q03GBHLCHcb9jeq1+pjebSVFd4tW7nEO3QRSu9plu
 Slw3c81bUfsanaJJoAP3lMMamA2Xw/E=
X-Proofpoint-GUID: HsM7CvXLHP-2RaJ62yxBIxejrDavJHpb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290103

On 7/27/26 5:45 PM, Rahul Samana wrote:
> The PCI core needs to associate the DT node below the QCS6490 PCIe host
> bridge with the enumerated PCI-to-PCI bridge device before child nodes can
> be matched against the PCI topology.
> 
> Add compatible = "pciclass,0604" to pcie0_port so child nodes below the
> bridge can be matched by the PCI device class.
> 
> Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
