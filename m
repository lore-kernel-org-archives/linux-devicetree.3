Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665300;
	b=TLq7fkkKDqaEFFUc64+MywYH2if7nFEltzSLirUDZQLNNaBOrZMmMpBg6kV+JsQHNnsZ
	 7+L+Mdq3j+S5BBebgi3Larm8LglAatSezn/aPMSn29Xge9HH2arGAmR2DhMbqUJChjrHQ
	 H/j+oUdr05H/RE+aXjNM9QCve1/GApkcWFRzE1fsJYkYAxNb2aDgUgZdrho+vLqG6hnSK
	 aMImO7huBViJTgBtAJvNGLdSOkE70pUm6+fYaED8pDIO7Q7PLp+WGaOYJaik+zduFOr6S
	 mIJ1mJNbMzYlT5wMLBFfZlhX11EkIXLlDgxfhExAUkMNQ69rzxzKqv5k4c5XrCHaiaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665300;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3pHu6LTjqoRt1XRVtGAiHjX9/n4iotAtMTU04HWhmxI=;
	b=UXuXqlhIjZq0X5EKEvD1irVfMLhB5zB5Vv+UsqOYxnP92hiEXbmIMXbzdK2SgbvWiSnz
	 siMS1bA6HQs/Bi9B1ZTjWh4/cd2OtC+DDpJhiuNFalgMN9Xlq7pH9b8L16fkl8pKDAsdG
	 sfhfUlZgZBbkOLCB2rBUsBzsB3fcReJoiE6M+8OF6QfnSN//+HWHEufpWDzBH8VcEmyv7
	 LiAI0KUSgfQC+nj/AAWLk38lV08FnhNythvdIPGBLmyXdib9Slzfy6+l2sbsTM6deSnzN
	 MEz7X3qaTcPT2xCcHYZ7lcJWLWSFr4cudZzVnXphbhSJGBCYDr8HVJXSfW+l0Z5Qtxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VWISRxhN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ikd4WZlb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10E7606A321
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C10E7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VWISRxhN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ikd4WZlb
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0E6n3116058
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3pHu6LTjqoRt1XRVtGAiHjX9
	/n4iotAtMTU04HWhmxI=; b=VWISRxhNU0Z9f8W8Eo6YwzGdm2GxsJYopgUdjPsh
	ZoCXQI0503VJ0bqYyuHXv/7q0Tsh6AWOhWlVQzkOeB2gzvQmqTDzW8N3ySstNWlQ
	FbhJQBKwwgm1Ojz7QITHtIS5ffjzZm1s2u0FLuhKtVT8JXSIltZ+VyJYu9ZlmqPX
	cv6KZt90S532TJ3Bui6H0RJbpz74gL1Cm92Eca4CQFNHMbFvpHOi6Frrq7pOZ9Cm
	RI/DzjokBPMjfJj5wL3A77vpvODd54QIY19+bPgxfZb8aLhgQ0NWBC/4UN3EXgQ9
	4zpfUbM6B0xSr1o9wC/1NbAx+8fmrnYXXV5QiX7QQ2fVrw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bt2p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so325196085a.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665298; x=1793270098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pHu6LTjqoRt1XRVtGAiHjX9/n4iotAtMTU04HWhmxI=;
        b=Ikd4WZlb0/PPqkdcx7fozeeQSdoBK9WayV0/fpfo1nkysx7ADVsyBGyRNjx9nVa2HD
         KMXGTtI8nyUT7cd2+0ESvBfUQ8tMFho7XiazmYH5HNqb32zyZMV5O2GLu1T6lUd0qCLM
         Po8uFYjydZxVr8F9jl7slfe35mQCcBlm5b9T9hdEbXcsw6LS1KNFVFzofuqKhyI3FlR/
         dhCRC7wPmRfJOTbV6PUIkunoSkuGT7cUi3sRIJVmxcpsZ5elVyE9MobIlb9TzBo/px4A
         WqQZcQ6NBaZTjrrDOhkX+2af6U5i+lj1IQ6hXiHdyNwGt5MV1it9hxuPLPs77YJhuEG/
         HBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665298; x=1793270098;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pHu6LTjqoRt1XRVtGAiHjX9/n4iotAtMTU04HWhmxI=;
        b=ASAtqTTyseUSu7fhAVekw7SVc3NP7EdxjCxCZavr1Mme691XlOfvfJC3EJXTDVKF1p
         wC+9ZvYUyzl3AC5WT6mliZm3wrN+9gf2wg/Nrn9gx25DHQZVPX/t/24uPCWHs2Rlk9SW
         hBtsJsAAvGWCpnvFg+hpoPCEvcsCl3TOh1AMp4Ysu6NhOixIVEy7U7CXTuSN3VPePg2V
         knzUC9TV6I3EoVBSZng08rQnyXLF3hGA/ErLz/4qQ+SbabdJ7DdZTS4wOh0D+YGqGsuh
         Zpzy8T5gC9nxDHnwHlB0Kol84QDdw+eaFNwO0U4bxDNNKgdhqfu45/39PExcses72BU/
         CVpg==
X-Forwarded-Encrypted: i=1; AKwUvBwdmWaCrUQFDu7LUPL+WsC13GmQ8EI3X/fdh3dd4uuqnuL59g5tJ+RDqE5AjXYUbm2s/r92K36tk/ce@vger.kernel.org
X-Gm-Message-State: AFq9FYLy6aOUS977qpbHAtP0KHgd1O3U5cOGh1h15JbBuXvdhnfsm9LT
	ZhF40fPeNBa5yvjjVHqU3A1yTZQP7X42AYikREndCGt4ysO2z9Jqw3HgQYi+yVcofI+4O+8aRSE
	rlDOooRSNQC2z12adHyRRE6+Z3rfK0Y76ncgi3QTyTfTOws6055bA82762LWiIBVv
X-Gm-Gg: AYBFou1kenWpUjkVYYona3wKaGedaot6q/lpK8LNtCG8fDU+qTnhxsBgPsF/Kz9A5Nc
	dZWLyIDHSeTSzIye4Ueui1kGenMKNMJPvJ04WDsKeP6R4mBGn7igmOuZL9WUImSSP3is1HOgxTk
	4OCuJ+KcyDCDuGPunFhZs7KPJnKiScj/fgOxtTp6IfQJARje0Wr0nb58GU4WBV6KpeP5Td8f6A6
	AnwcCNLbHjn6y6PR7DEUx+wi+Yjnb7biltWu/qhV9WkaYEMjd+cGN78VoeXHaiCjnB6noO9Wlxr
	yONJp3yuiUZLlxm4FxLTTE4VvaayYJFsxJk+M7V7OnzHO9UgxK9Ah3hkRFd15MZ0YYMXIKMVnRx
	JyLrjdUS4L0xvGjONp1oyI1zym5WqqqWfheUU+uwweCXCtvj+j9WUYfVk0dmGvZrMCI5vYY167X
	SjLrm9wHY2+8wS
X-Received: by 2002:a05:620a:4481:b0:93e:60e8:c9ad with SMTP id af79cd13be357-93f57e3fd7cmr836829385a.12.1792665298208;
        Thu, 22 Oct 2026 03:34:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:93e:60e8:c9ad with SMTP id af79cd13be357-93f57e3fd7cmr836827285a.12.1792665297749;
        Thu, 22 Oct 2026 03:34:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1b94eb2sm951886e87.45.2026.10.22.03.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:34:56 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:34:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm8550-qrd: add DisplayPort audio
 playback support
Message-ID: <y2llowqlazb7phr42o3v5qvjk6qkixgbc5el5wdcb6knoru6rx@qy2q23s5d5wr>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
X-Proofpoint-GUID: dcSoMH3fjoK6Ebp9t8keuXxYu2j7DOWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfXwRwi9r10K0j9
 TPTS9U1tFPtJ/CEzHDN+mrkbRiOCOhRnQAn7V/HivrYwChGjyWXaMs04zdBVpwWneJkVHuiRTAi
 4vXXyGj1iQeBXAeVzsqh1PoRC7qEOEA95IUi006l2Pqh1SN6D53lRtAQwZeP+MepppH1ILYY95E
 +WQS3XQVt6VM98mBY7Bd+PObKCuCRiMs3MWroOo1EKZ4vvVRAh3PmAxnDyKIjlWGWDPs6LJHtdE
 YFE9BwhKiMy+DoJfCRy44uqj2hRIo4kMsyD93ZZq15SFwz+hZ2DyeKT+zTtwQBS+MJ7dkHJeMD8
 kJ1R9FiA08ISt4uyEz+zWxOC1q4JTwcBZzH+4b7MPJxABTH8RW3kSIDp/zRyp98l7I2/ei3FQYr
 UWEAHF/vBgtg+gyOyTTzKnsa1Ay26hCVbZJqFhQv7X/97H63FiM++ozWsuAXl8ifYkL18d5h89Q
 ojdqZEUUOfoKlo+/Y2w==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9e6d2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX17BpXaMlWPnm
 uLmmBZ/ShMycfWg2/DiAMa+RF6DDHIhx1v/2iVLuNrX8RI7ZkBbkYa/1yBNl2uHhcFIdQ+uyENF
 2WyR6jdLec3nIukNID864fO0WAKpF10=
X-Proofpoint-ORIG-GUID: dcSoMH3fjoK6Ebp9t8keuXxYu2j7DOWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On Thu, Oct 22, 2026 at 11:36:23AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
