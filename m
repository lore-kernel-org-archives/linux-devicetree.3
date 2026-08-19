Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329E830F7FF
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787109437; cv=none; b=mQ2GubOvl47FQbkJr57HpUArSKZOcVbIFqKp8J+XEP8hfPZL8O5kS1l/5Uc7Nhkj2qPSTw8xaeVsUaaKojGjeSAHu5GiBTkjb2Ry+GmZ2eeHMAvjrLXT2rwuMGTj0MDWP8k/Rjd9Qakh8nNx9qMlwx9JW9Vp9npGJT/n+qBNbkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787109437; c=relaxed/simple;
	bh=joxpSdDRFY5uFv+VzmFzchytVDkJh9auHgbzpaaFc9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOzuhaJQvddPx7/aopyvI3dmiH7Q34wa0CddZPrX/TnBHoGrVHcNzjyX8E95Mn3o1TR7w4AxYsxgmDrAmJamGllXyZRV95EBarlTyW3MM7X+9Yx2IRnfo/ow7nXYJbKGxHB0rEDA+zbPc/EMmz4SSLnjjO+M6bDuN6HCi84cWQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKD10HAi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baU9/qMZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKD10HAi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="baU9/qMZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J2lU6c2669717
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hlINreYE20QvbsWRKB9jJ8Pm
	iH1RXUH6T14QxKnWCfc=; b=MKD10HAij2FTSYD0ZvGUvqWzQe4gp0AuieSRRL4f
	zOpCwdGVWL9buJcvaq1Dsbr/62HdqQz2INQ3tauntBiKGcEIl4IfAXbDr2y94NCO
	jt1KGQZT732OqFtd6o/DmNLxnjLET8JfilisLdyWRwMeMcfexw/O14+LSaolgvwP
	iRaLjExWfrBC2RRMYGWsllqxNmK8I6uuU76aGA9hFd96DUiJXe8pGOgjcVT4W11J
	Ydq0uXMofF0EjIlCc6/FynF8/6pEsFpAsu8iQD6RXDKUNP4iQtiWuxVjj/dFFO2f
	Zyltx3vj66IbPeQEcLq5vDJo2KGMhuIADDKAIG7NkXheNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkh37t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:17:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92efd2ca21aso110069785a.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 20:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787109434; x=1787714234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hlINreYE20QvbsWRKB9jJ8PmiH1RXUH6T14QxKnWCfc=;
        b=baU9/qMZXoSrRgPZxBcqSO6W3k6Ch5wc59p4Ce5RGB2y2HfTA64/a7w0jtSOsCtJ8R
         yGs2gzgxdHKjLnToqkV3pHF5gBFl3tenXQ9KNEGmgtxh2oFglvMrsYjjJXmvOrd+m+iu
         9WuxFbQvdPe7heZ60sOZyg6z/YSyJtVTaLXIJrabTRDGST1NgjY3pLMdgviy+9CXE7hs
         /te68wUV/QosO0zGDLN4ENWixecFEUfruSfH9/CDSk3s1fPiZpUtrp7cHkINr5YBqDGf
         pB1ZqQVUOdur1jyokDdW2Qxh2jYN67Oq+VWATnPXPxQdsnEwPn7UNG9YF5sXDUzlJE33
         PtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787109434; x=1787714234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlINreYE20QvbsWRKB9jJ8PmiH1RXUH6T14QxKnWCfc=;
        b=A+HKTuxF2kZ1hOA4JMCE3rBDg/ZXcCwEOmC2Oh035RfIPklvXX0rYji1LzVODX5y/I
         HdcwbCb8KSTN5i+57k2jE9T2Roq4MOUHYpf4OFc7Ma4Pdxu/NU2Kx8JplOr0FrsV3up+
         XeiEoW3aFPc+6z91+IV50VolxDV8mQ9O9/Uk1k92hj6Ahew+SlbN+0Xi1aLkUd4vRTtN
         2OqErkA8dtqcZLsLF2zOTKrZPpuqbGRcgo5FjVSrZPK3q3/XX98trTfK32ZHOnV2wG/f
         3LhUlkIrgn1bgyMK+TLeKREKrbS6e/4bBgxyO5Nab/HZoV7e0qTlYuGEL0keWYyY56Wo
         Ui4A==
X-Forwarded-Encrypted: i=1; AHgh+RqOSoSlOCGgbjszJ0UNDOTrvKgVMpeN2swXef73Wpmb5TLHJO32pLWO/bXQlvZLmb/mBI0iYU+ji5+P@vger.kernel.org
X-Gm-Message-State: AOJu0Yzts1hd7iV3bkxbXSYqJih7e3Ctba8oY/ZNc/W8WN+xvTWVbMF9
	1Mmv6yU1d22+kRWkDjUOQ63Cci0MKBqP+YMH3KwWbx7Xqua2AnCvxEd3awLPydSSGY1ydAJvsMc
	IrQivSBRIUvpLVKIEQpjKiWzgI6o0pCYP0CV1MerKoD5n+/21jgVduJ+jjcqX6GfM
X-Gm-Gg: AR+sD12r15JzPUM+iuL3CFJZmg0OsnPjEX3PE0ojL+71HgbHg9pdt4u4slb3Y48GkT6
	GNVbT6Dk3EHU3ikW9eRMhsDRu1rcJ6/ABne0AOTfnmfFDdEoDGJK0oYYbr9lLAgd7JhmkrOejTt
	Mmw/BReLwHgeAlJF2DnlknNrSnM7HxLTRTtoTa8FX60+X35cquVu2TNbJEFTFFvsWKmf2XlEyeY
	hhsVOg/FhLUShL1eT5dKTPZxJIecmouTCkNB0BdiGMkrUfBTosuFvwjnX1Ga1vzTQSPC+Fe+tH+
	8Lzv5SjjYKiKz/0Uq2EBlzEx+INaWzxKfWyccjd8qP4Orf9LUbGvcK6kzhzcv0c+Qgi3JjeeCZc
	gTWKbL8AKJ7eWITw=
X-Received: by 2002:a05:620a:4084:b0:936:77d7:55a4 with SMTP id af79cd13be357-9371e2451a8mr196564285a.19.1787109434338;
        Tue, 18 Aug 2026 20:17:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4084:b0:936:77d7:55a4 with SMTP id af79cd13be357-9371e2451a8mr196558485a.19.1787109433837;
        Tue, 18 Aug 2026 20:17:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17567asm23713175e9.10.2026.08.18.20.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 20:17:12 -0700 (PDT)
Date: Wed, 19 Aug 2026 06:17:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        bmasney@redhat.com, lpieralisi@kernel.org, quic_tdas@quicinc.com,
        danila@mainlining.org, davidwronek@gmail.com, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 08/12] pmdomain: qcom: rpmhpd: Add RMPh power domains for
 SM7250
Message-ID: <qzwjmmrxlg7s7dozxqeadokfpyvwbcdgknddysgewvgbw35od2@cnhnpmur73zm>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-9-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-9-sreeshankar0910@gmail.com>
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a85203b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=Z0LeWUw4VpMA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: UKmdF884l0PA3UusWC7wcIa2SoZrTt55
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAyMSBTYWx0ZWRfX6oUxoArHWMzX
 3rDL+Twlh19HH29d3wNp9jRt4sPJMOkNaMXVhlgCCsmnenizK5z5g2nIQ6eHFqWOFupb2CliOJV
 j/Az27HtbQNuyFLhhn/u6TP4sobKheA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAyMSBTYWx0ZWRfX/Pts2dtszipj
 YP+VkKsYtKx4liz/4Ks7URlhlPDj13mQGWYbR1Rvv4ax1WYyx5eWh/mpkQG7HW8HEjkAF5o1ai7
 pMg/RGMZTpcxUxdA6hW1bY6NyxPIigcb94JtJHxwA3/0SmQ6gZO8T5Bkn4BN4NPBshiKIL/FkCQ
 mTIIzLSL7cI41FjOQXWFDFFPZFue5Bg+oIgz6yR5UTcUEpPkNpMeHqIgu6az1m8LmISv522ss/i
 UrUuio8YlGLB7aceStof2583s6gNtlnSzXBJIvQXG43O7cnYo6SAU8R0/ML9wQcl0rkc8UuysG/
 dmusl4/U25FtCRVngRDAHyBVVg6Ef3tEDF/rQ4URCYoiWaHh3zzdz3V3xo4/jJgwbCOgacm/3+O
 R5Bp9YJR8rrRbPSWf7jRt4AITyiJY6Xo0nnZhIdV8bogiqHtj04F1KLnj2iMstdfv4g3gNdKkhM
 t4UT3WPq2VYZ8PRzBjQ==
X-Proofpoint-GUID: UKmdF884l0PA3UusWC7wcIa2SoZrTt55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190021

On 26-08-18 08:07:50, Sreeshankar K wrote:
> Add RMPh power domains for SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
