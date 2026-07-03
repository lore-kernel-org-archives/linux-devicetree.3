Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C2935B63B
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075830; cv=none; b=f8ZeA3hxnij6idL8xcyWo794EycF8l9yNBbBfOzd5h5siXi3nGd1NpNwZGRmcvwiGU06Nm6HGirFFX59/12fpTNdLq4KnutVEfibQUnNLTd+UoPQquOKYmfeMrNBstjZjWFtBh4ugi3TsQnrPkOVmG3aFcF0/bVwwXqhdHDIEQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075830; c=relaxed/simple;
	bh=sLvK9FUnFoSATdcnQ1dFAeGQbdgeVwtcU7iPxUH8xtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2DdABDq+C5ElEM1DsIxXRyXRFlZkUGvQ6A7MBvV+RME7dSyTFqgL8xa6/IDIlxPmJ7VIRcHS6db3Y7lBIklQf5P+FZ8IkiD0sizLHQg8/35zIuiK5m1rrY6X9pYJWsxeYXk19GdeqZB/YDoswx3zSojkCWMmKEIaGEACdZkDbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C27DU2eB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KgHf7cy2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C27DU2eB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KgHf7cy2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rtt53123895
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 10:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35THU6IAqawmCI+7sWflRA2CBA8FlrZ4eHuYrX/Up0w=; b=C27DU2eBUaXJioho
	Xh335HYQLZie0n6MxTCWCKr78kuzTDgVy+L9vVTTXorrp62JwVXlp6fxTOSxy2mO
	yxe4wPxzKWZh+xAvZsLidrJto4hg7MnXRVEESTUpEG9JFIZU3Td+RpMA3uHJPyxm
	5RSMHrhDmdzAE9v9oFp7/YzKLLqeU/dt20Ig44XVoAdFZfisAI3YQfsu3GdxVO6e
	+8IEvjg+TAACPtXpNOj3w2Ecdxzv0uaGdIXta1IwobqSBj+4zwojHw9i0V4pJnJK
	NUb/llCLUx26gW/N9D7SJl15lLhZq26/w/MtF9h7YqCHsq+FhnwqXIqIliFS78RB
	fFwrJw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpcx9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:50:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8efd48cbe2eso1017946d6.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 03:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783075826; x=1783680626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35THU6IAqawmCI+7sWflRA2CBA8FlrZ4eHuYrX/Up0w=;
        b=KgHf7cy28JsGpncMNV9G0wBQfBt2N6QtJ+3wg7ylitPMyF+rO1XSj4Wv39i4eS/1ui
         HvLChPalIt++k+c73gPe+keSDalDJAVnAGY3rfkRDnh/k7D9T8jsWl0aqve+jqL2REI0
         DZST8pzd9mz8Ceo0fqgfq0CvwNyF1J3bZzkj7FQLqT1gxoLkqHH2aMi3pafw04GeLm9h
         NcTR2OIQFYlF4IMmcWHcrLN/fWA4XR5BkuEWlXmuskvkiacFtb+b8UnWN0xhlsGLQYzn
         JWj7/atwRoNaY0WCWKez5RynMo8BFQNsBZlapblQfNKrReAVHyfCbiIWqY/wdRn2qywb
         qKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783075826; x=1783680626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35THU6IAqawmCI+7sWflRA2CBA8FlrZ4eHuYrX/Up0w=;
        b=j0fqDN6uCpkeQDASunySMGAmLleKi29LIQuq1THPibIsnENoUV7eHC9c/pf0jropcT
         DLtf4cZ23s6Xjk/Uz7a9bpVZnLRpF8sp2yu7VS+th6d2H36XcvCMF6WYfK98YCISi8oD
         lHw+VUkRn+mLKDQNTxp/tQJXVE7EQMMF6+iphQQKSCloA5HL9Yh8SLXk0iL1rLXb8n2+
         VATsCpJPNuCbxDcaQt0C/BQxarI/E0zaNGDFFph8n54+ZuOC/YEKIkp6jezYOSPKnwlM
         /JVx9+XAflXA9k2x1k+0pZH4OwnZk9eYbh2sJL6KmI+M9mn4zlEix06g7/WIQGM0ZP0p
         xt3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqW/I0puH2LSG4X7jhYJr0h/ZQ2cwe7uxhQKnn2GqMhezrd9V9x855NkRFJG6Ap4gUSgAnpRDVhfrm+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq1spO0d9zMVB8pcy7BZNeCrmOxhKnTevN5x0++9tQOPniTOL8
	e+onp2tBc+FfTvUX7wCgWKDzYxOx8M/CEglBJxP3mDLXE967o9VTIld4aBhBhGVWwlau0yzDlak
	d3CDyEtlL3OwXZQ+RKoHx30TYHR+TIJKuZg4aLkHj3RRwnh0gAsO9SSBi7AgLKclyFofM+g4W
X-Gm-Gg: AfdE7cnf4/h1+pS2w519ENT7XJXsIAvw3ysi9Pkm+I6lxbhjHVNW3V8enez0kGAdEVY
	5ah9KXlhS++1bqmhf9/NElRGVo+v77gkahvd1K+Pp4HsMl3Phi+GBsgxBxLmUad3kTMJQJknEVi
	Se4qRNKvd56biXqpnvEPXWNZxNDFTg2QPNEDXiyiFREmzLR+o+Wrm5XVVV46SdFsMc4SpgPsg/Q
	97MbJbsu0Ttsu9W3oK/YYseVGMH1OVZ/YN3JZfZ9SSPrSp2Ip0mp6QMaGYTAKo81JQ631S0g0Dr
	JzgcMGrapxLDGsGHWYZP6179C5FjuArfgD8lUGZGAHo3vsjENVzT/l274q7dNH7pxvBq3Jmm5fy
	lYdKQL/xESUa+J57kMF8cCdPRArzL2j11lYc=
X-Received: by 2002:a05:6214:61cf:10b0:8f1:1359:2af9 with SMTP id 6a1803df08f44-8f3c9abaac7mr61817966d6.10.1783075826011;
        Fri, 03 Jul 2026 03:50:26 -0700 (PDT)
X-Received: by 2002:a05:6214:61cf:10b0:8f1:1359:2af9 with SMTP id 6a1803df08f44-8f3c9abaac7mr61817826d6.10.1783075825578;
        Fri, 03 Jul 2026 03:50:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698acf22e07sm2309404a12.7.2026.07.03.03.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:50:24 -0700 (PDT)
Message-ID: <e644949d-e5f2-489c-bbc4-8204914af958@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:50:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0
 and l9b_e0 voltage for SD-card
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
 <20260702094056.3755467-2-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702094056.3755467-2-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX/LCozxiDgUvW
 5UmCwpiYfpOoaGpJvl3G23Ks293USNhXSGXhvRcgkOawl/2Mla6qFQuNeYJPCz3xffGeaySbID5
 QzGSGA0mN8wXDF9m9Cg9idpzq+ScpTo=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a4793f2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_FQnCXsvKZllb7IERd4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX1zWVc2yUp84h
 byUpshbkosMMZvjAHhMU9McOa4XSzhOuzGn23JNq1vo/4l/8Gg7yUFX9Iu19QsJ48LXQTuLpPyE
 jixOXgA++kt0n3VjNoRyRdsRAOF0NzCiMvXKU3dIKcF3/xyDRcvqjCSH2qtMub/fYilvdKXcRyb
 ySwGkQhJA7PHD/VDKbhaRzd7DRVqruikmKROLLlsCf3zjXyvlt1UHb4VNcbpJW7KN1MPpTKLUDS
 PasxJqb7hXSFen/jfNGmfyLeTNyufeQSs2JePVkSUobuDAk6ufgHbONJxdw2svwBPnbs7bgmlv/
 kuX19ILQVuIg6ppyrIjlIMolpZBJHJ/0aAWAEav7W6vAEkzDb/WqgdKKUBLwlQbV/YXGzcEMna3
 N+ftSR1RG8YvHBlYHKTeuGMds8JlQ7UMpEp+1vjbjmhdaPmvDbdmFS9x1lXqa+5tKYqAdYt4Ck2
 q6VFFEYtPcpvz/w6pQw==
X-Proofpoint-ORIG-GUID: 9zd3qxpCh33RFuYaKFAN05DBt6y5bQoX
X-Proofpoint-GUID: 9zd3qxpCh33RFuYaKFAN05DBt6y5bQoX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030105

On 7/2/26 11:40 AM, Monish Chunara wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> SD cards may need 1.8v VDDIO also to be supported, to accommodate this
> requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
> supplies to VDDIO pin of SD card.
> 
> NOTE - Since this SD card is the only client on this regulator, this
> change should not have any side effect on any other clients.
> moreover, SD card driver takes care to explicitly vote for the
> regulator voltage based on the SD card detection sequence.
> 
> Also for stable operation of the SD card increase VDD voltage
> supplied by `vreg_l9b_e0` to 2.96v.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Please switch to using the b4 tool and run `b4 trailers -u`
before sending the new revision to make sure you pick up review
tags

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
