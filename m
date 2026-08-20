Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1CA3B8921
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221793; cv=none; b=Vo2MWi8Y8IaMETavBuQmMvC0iulnW/CVtHFjewyqMurh4CsD0G30kJ7khCdMkpU52wFt4YSw47uPg6cBW/FY6HcNhvrPaUuCkwfsDLXjpPiewuOuEYcgV8beSu+L9JZn/joidHzMeKyOmqF27aBuWqKOxiJsqdOLvRrnUEuOwgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221793; c=relaxed/simple;
	bh=HPv9hQ1X4Qdl0VjYTO2v3OjAX3zC8AUQvrpeQ27AzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNcKNkZ4i2bLlF+zAuBSr1XysooWYo1uyZRiH5G3To79Xb6JhMtZtsHesmG5F9di06Lrj/76SNxCQE6L4VKI7IpoQwgRTxK5OeU+uuyEzsFmfMFC6L2GKd01F4ucwUWCJBEC/j5A1ZH43FEOq6WOSoX5GIvaq5ruY3dSl6vYTzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COFh6Nnb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KctB1vnQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COFh6Nnb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KctB1vnQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA3JD33454882
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=; b=COFh6NnbWh6jiKyq
	9XkZe5ek01WJnmnkvb795+Z7wSHV7fBpf040OYxpE2fMxyK0faGXoXaTUGaTDS89
	Sdd23s7gYP0KqZXaCLfL7CkyC9ioPyqVwmeLwW1cpXpDtHijXodkFyl8yuk6TujK
	Wi41WicRKJ96UBk6fYLzOv0pwjpS8KdDjADpE7xWYFdhTG9mbUVZ6bbXn82EIArI
	C2f2UHR8CCwCGEJNNlE30Jac29/gXVpzK2AmRUMMFKa3xS961QYF9wBUNteg1baL
	M6HKhqR/Nn9Q78lMu1ychc+NTT5QgJE0tCo0n3yjsndoNv3d9Kn5qF1w0Iw9jhkQ
	lOqFAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg883ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:29:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d57d17d6cso1038661cf.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221791; x=1787826591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=KctB1vnQ47wlXhc+jJbysiiWwmimnUUvuiZ7H2xaMQXxEbgf0Y9M6B8RnYMejpz37R
         iRdmfIQ6vUfdmSCul7adxUxl+vqe7fYS/p1kp+2XgaL6kXvmhqkJUtuB6bckWxJIVKS3
         HRhgQBoFkPmDr7dystBO69l65xvohb1pEFolUTDLdUJh+lDFQ6JrYI9K6Zd0Z37skGPJ
         5zUE801Zdl1I/lKr5oSsrRCDrL68Xy+zq2empBxbm+hlOiprU55u58cP04/GJY2G58Cs
         DOeP3bNcYM+fGX3ky79m+KG6DAtv0wQ9mhTWSSgGA7xx8KDm7uSV5I+lXWwepkHpw1P/
         Tixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221791; x=1787826591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=fE3AFlyw8loPOorihW80r9c9Efw1Rs0lssC/FLe79KmUQO0NC7s3px5QBCL6XiGnrC
         hERO+wjXwQMyvhC+prmElPB3r2mllciNU56Pj3lTyEZBtmkFfSv9zXZ1HGNDbbVaizTU
         a7LuLhPUh8sg0PGjTE4J2FZZ+TS2+QtfXg6C0E0FGjogDkteTsazwke31GchZ0DibyWC
         iIfAxnP/vz/+xQhLWteHmME/CenObh1lKpYjlPlqM74SJmmW0fAES6x3Ds5TWFoS1pfC
         EFBEuhzhTFLdJdFXTMTH48reL0t0QbOJXFcMvW2ZYMnIRWnNtPeJQKev651WZSdlPzQC
         y3/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp0zan1Go3M2y0ql3jmjGshBNy6sGJDYzr16fDpkXtwEwVYMB/U4sW3VRymA3gKPz1Kh35h76mpVP1S@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg9oAw9T5ArpPudaKkcIgH5wDZFkjSblA7K2pNQHmBTDLJaM/a
	jQQKQNO7n1V0UMEtnUTWLiIPlRs03+USaqwUe/6Z8jQcLEjSBo1GSkI4e/+bgIVuUCo5/UB6gEp
	wcTVglHBPwEMA3NgaDpygOX7cMtbTWal403De44ZnUOlO4yKG3cmQJJYXoCEkTAKV
X-Gm-Gg: AR+sD11h5E33PwSEYVVMY6clBSHSefPdKKBvL5OvGpJ8jCo8ZxkgXNWjS/fJ7D+8xr7
	omLigoIlmVElCLDfamjBUKUPrRTGEvl/te7P8atKaTdRLueeEwQC1lz4WPstNRYlv+4NRS8LEWq
	qRFGpD80gzOSccqHJG9U18skHTmC5RWSEUYkZe3bPai42EVCyHYP5FqoW3usbTqChbmJTEm5i+6
	iVqqGYGWooysLPiVjXDd6zEWKIvWDYB7pkfStPy34sqBwdoJj9jF9l2rtMK0UOw+eJ290Ov5OW4
	ZZ8sqr8Fk77UYUuiPp1hyhXuVv10N5dgm3Ll9FrFXhVQTkALcQx+oRM8rkQcccNwTDHWoWyf+v8
	fOGRT95Ao/FIlwq0fPPTKiUWY
X-Received: by 2002:ac8:5f06:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52dd61a0e2fmr76568901cf.5.1787221790610;
        Thu, 20 Aug 2026 03:29:50 -0700 (PDT)
X-Received: by 2002:ac8:5f06:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52dd61a0e2fmr76568691cf.5.1787221790249;
        Thu, 20 Aug 2026 03:29:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e224dsm52452666b.2.2026.08.20.03.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:29:49 -0700 (PDT)
Message-ID: <ac7cf390-8135-4bdd-9fda-8ee5fc31d3f1@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:29:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] clk: qcom: gcc-sm8350: Tie the CX power domain
 to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-2-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-2-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX7GNO1fuD75MX
 aoJvV7oj17Vx2fyoGT9ZfwZ8gvGmI0SWFIC3XZZRYGVhjTlTpkoMSHPrpmo+u96s+/bqluDcpOz
 cuakOZTPAlC+/+JVK+pOTIbvR2ap3ys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX7DANbqgyI6WU
 wuCfM2y4zzHzgwm8V4ZK2HndNyGi8KowuHPtxPjSkwSihjsROyPJoXelcCCOltY4vBvWyjdAMif
 +vXmloi734rFKGdKbMcQQDbR+MaVlmVLj7bpjxI1/aEwBfwXVExYow7x63yr0zme5iTysIAQM/n
 qdO8me5zR/6CNtu6omZNAQeAtm9GfTHz0quEl4DR0yWJK5bbRm9a4nVHyu82VBgpX9SBAHqPW55
 c7QTjLaxy9Og04O8ElJCWEEjwxuZzL2i3d8p67pivknISWr5ZvzNy7bvQ7oV7BPOumfh+u0fS0t
 DKYjuGQhv/DvbHqIWagOeqC4WuemIlFrAS67pFq/gHPWXvJprF2Jzb+issa7kLEL/67gbc3P1Tm
 PrR0GMQccD425OiNYCos1JvVfiLAdrL7CvlgTVsOQtIqHXMjy3p8wHP+JxdoWXQgHevdo1o2goE
 QCB+ZMDP7z+PbRkgK3A==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a86d71f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ZpfD34ELGnULPlpnjdJZ_4s94kQCVKtG
X-Proofpoint-ORIG-GUID: ZpfD34ELGnULPlpnjdJZ_4s94kQCVKtG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
