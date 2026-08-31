Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A716B3DA7D3
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165161; cv=none; b=XuBroA9IhOhSMZl4eaETTWl21UMFTTy/9ub2nM2RipG2UM3QcLAeQpNaliLmfCcpExRcpbTTW40FtlnrlYyoAXJbNZZl3hedTDT5vyz9JsogSBREC3C0oBixmeVMHXPqp+6IJZl+WBKZcGLOYUjK8jmC5XlMQ0WHBFb7No4I2V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165161; c=relaxed/simple;
	bh=FdPvf3CpJV8G7ERNRTcYmsiCOMxWZLLUICoNXusMRos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuNhRE1Nwvp4vSMb5+zDbH9o/z2rRN15v7RHDwubar1TukuwgfYyWqa97UeuSQu8SyqFo/gy8Ofl0t0U+nkqE18VNV7p9N0wDGn0iE/Wyw/+rX/j4j1G+tfPnIfRXXfMymERi2Oi+TLWjFr7WrImCXA79+i5DPfbakLXI2+Y1ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIy6zNC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YihcxCnJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIy6zNC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YihcxCnJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xIl32460282
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4dne+NCeg5fJw+Wr39CNTdUR
	2y524dRLbe5rTW0CoI8=; b=DIy6zNC1zB4+GBlzjDbD/8D3IeC6MStSQfkLT1Vj
	9ALGyDD/LS4PirLsusTZpAMSb/a3sT78AakyO+wRsJsiSY1uzVQ7SZIkUeyC00Tp
	0SxuurCqWlTGJ1hj+3KK/Sc11k5IpG30NoIZ+YTxNmoPNQKaxz4vYcqCngwk5J0l
	AB30CnsOV4STdgoX96vPeRcNMX6Whpga5Jigax/fm/1DLZAWY1HwXU3C+Bm6Ylxd
	pwXuj1eZVeuBFqp6sppk+oPL66m80IivMmvyxy/EJYwaGUTyhyS5REfZVTESjVE6
	6RUPJGEJFoZxyH2SKV/shdgqtjhYLyn50XeVO2h+ODLMAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556r9nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:32:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so817089585a.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165157; x=1788769957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4dne+NCeg5fJw+Wr39CNTdUR2y524dRLbe5rTW0CoI8=;
        b=YihcxCnJYQeZIIRFmeZLCEYQhEDoPVoMOJgeOOULfSyfiz1I3FFG6cFNqX4uDJcJ4s
         KuG2GBtnhYsWsshjhH69C75VBdJDd19GJ3VhFXb7/jQ/J15zA47NhcLvDXrkbucwaqKT
         bdah6YY3fHbDNCCbJZzeGnOlQ3TymD2UBwrh9YN7OO+LipSf503dyyEWwIrnj4yvmDBQ
         BPj3zFUROA8GE/cg1CzoNdS/SNfVMsKLpZTyKt2HRhzGXImH0SWkdb3ljRxHPKcCHnBi
         QrQnWRICqtQb8J+Ov2eej2tq5bG+Rm7FA8GWkwjug/p5VgIdYLuKecvyQfQzPO+tqBl6
         rlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165157; x=1788769957;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dne+NCeg5fJw+Wr39CNTdUR2y524dRLbe5rTW0CoI8=;
        b=ayvQvJQiWt43C+wNPfROpkRksxV+iVYby5YvvAV+4/w9TyXiOuw0mwK7bUCGKKoDqm
         RtBRPhNFCkgm8rIBjklsa0VJvlK1Fsoze37qr4Oto8qaEzQhsSVbhFJIFveb/+jQag71
         EDtiguIDXGsppZqm2xblZeFtBUT6mMEqwHiluWWTrJO+XIvvHI6ChRD691vkzvGa6Hju
         XfdV+MTtWY/hpPPOJDenT/xQzHh5Su7mKCvR944Ve5JTildZL3hAdXGhVq3M8XhObLM3
         X+Iaw+PSKHJ3NvqW7v17Zu3knTE7A5DXhBQ04wYGpT6TqzZxauq2oRZy9G1BqiLzb79a
         cCtw==
X-Forwarded-Encrypted: i=1; AHgh+Rrm4zurYSSvnSVd0js7/+JRnH0n1V4jL1PeU2tsc3+lHntawhxMWdkVDCxUAN/FgA1Cuvj1FInFb6Bx@vger.kernel.org
X-Gm-Message-State: AFuF++lGCYPPIFBIrX0KZ4yScpGza30KdRpNfIvRnvkeq2VsxQkbplYz
	Bo4atmLz5KWgU+602CmVz/6mlwjm+jyrj/4TyZHdAWwCorvyuI9Xc6LLZWPSlw9UKMU4Bxuf16U
	v++KbpI0ghHvhXrqovNI6wIWBskMYqysnl6/jri5tsqVCPp+3OTrm53hdgiX0gIDB
X-Gm-Gg: AR+sD13hW8qKi13LYz2V4z15b3Qb8kig400aI9CPLiiyKAyTVrjX6ZIplKl5Zaw0w+c
	Nbc7+BlkoJgFXJSfySAB+guvIfZOfwurQBMK0KDgURBdVNW2+7VxAXVgVeG3Np1X8v42DG6gph7
	4OXK5Tf11dfFu7YKPauJlZNiW2aNgRnlU1xW7+pivSrOctOT0Zujy62PgwEEIFb2ByKFtzwZgVe
	QwG5jRLgv8YG7pB/0TaWZAEZmXSTghBqygyX75Yqre5NGCcdyhMJETKxMD4oH7oqGrUWFgup7L+
	i8QQBlsrbVcAsntIyInU7uuqJRU8vuNMjP93wJaQtz0syhM23DD2WjkEksA62v+bhXU+Lq8N5RZ
	EASwYlban8sWC
X-Received: by 2002:ae9:f007:0:b0:939:869:a8bb with SMTP id af79cd13be357-939137d1e5cmr2249785885a.14.1788165157264;
        Mon, 31 Aug 2026 01:32:37 -0700 (PDT)
X-Received: by 2002:ae9:f007:0:b0:939:869:a8bb with SMTP id af79cd13be357-939137d1e5cmr2249783185a.14.1788165156700;
        Mon, 31 Aug 2026 01:32:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cda123ac8sm13931255e9.5.2026.08.31.01.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:32:35 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:32:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: hamoa-pmics: Mark pmk8550_vadc
 thermal sensor provider
Message-ID: <jwjfvxf4xz4a7rg6lnkrxpnm4c42kkvlyep2rivzgcelrd3too@wat5gp5s6zpw>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-1-27108c40fba5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-hamoa-sys-therm-v1-1-27108c40fba5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX3kJ6ewI/oyLW
 Yc3t4Zx0ZIVqsQvAOEeER9/jCxyXOnkBgG3eE5IMBe4s0A8OjybGVaiWFrIP0w/d7zQRLlr39uD
 p4/mv6Jyqy0xsjsdAT6Lmq+aSPEKGGA=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a953c26 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=AuE88ix3_JtRZqt3Q44A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: scbyIsH-I0Cy246tcfcynD61uzsEcq-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfXwNFNCxL9bzdw
 USfNAYZ+G7EzH1w8cKKZLvcoHFEyeppk8PmjFn0C6+G3dhvdcwkyzN2ug9SS/fVdjWv1B2lXBNM
 dzmeSrpO10RtazRAoRSqVw8+zPWxzcvfni3Shx90tdnttzY7CGmP5vj3YvRHdbel9Wobfn0u+bz
 H6c+A+9i9cwkS6wESjhKu9WdKE3vAljiBjptpLIKNKFM/6dJy90R8cxXx/baE2cVUCifzy2pvCf
 Ht0reZvjw+G788ETdp/3a/iDSKVfS7+XGEvomEiAUx/GW5PTocTzemO+X+8eZaKiT474xxC1Omd
 urOwcNPbruz+zq0RtfkZuGTMyT0scBo4k+IH0+APYNVaBlhA/95tO23rtLA1YK0eL3U9FqiiL9n
 XIU9zP4u0yapVddDZ+qalVwy8fUbhtp3kdED9tJ/cwJ7Rt4b39ynZJrUa24ytdi8CtA7uEG9mzz
 oXKhi0ZYR+EnQiDIGpQ==
X-Proofpoint-GUID: scbyIsH-I0Cy246tcfcynD61uzsEcq-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310072

On 26-08-30 21:02:02, Bjorn Andersson wrote:
> The PMK8550 VADC is typically providing thermal measurements based on
> on-board thermistors, define #thermal-sensor-cells to allow referencing
> it as such.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
