Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E433A6B66
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782649862; cv=none; b=RmmUXwdyeJN+fZee7FCscjQqokgkqWlYoVIKWpOEkH4V9WabqLwZyPy7chR+rURriB0dKFhqUJrDpic5oXdjPB4beOJXKw5LOFnl4CVAIT1HOapUyDNHgO6m+rb+bdJeWKE0kKLqR9mPFIyjk60eXqxmRuLPTC5HXqUPVPz56xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782649862; c=relaxed/simple;
	bh=kvvgU/Ltpea+98QbQFnrD/PULZM4PP7T/Cf+PKnxCTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovS9ozWlt+O8Y77SnrTkLNm3qaMgld31l1Xw8vac9hPsljthXH03uoHWN7dwS92dUuT6qepwVzQDhhYIdWOyXWiN9MWk/Ssc2rdvQc7OzEZoZnAzF5+ed2IhgVA1ahG/Cf47spbqr9SOPLo/MEHul0ldmLdkWmDIC+SdUaLN1U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTcsZEfs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4FvhbeL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTcsZEfs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4FvhbeL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9OrqI3616536
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QMf4XwXgybpl72wB2JwO5JN4
	qSQjXQLTpvnjFvTGKoY=; b=QTcsZEfsIPJbAmTCwTRdl2F5UXRaVjhcwthiP6em
	waXwTWX5yCRG9J6NUt1smlFOOt0hulXnEzf/sKVeyJlfJV3PQK3BOap/A9NIMTyx
	3p/Pw52xg53tuM/Ul/PBHTTDa+kFca6zssmmncij+Gk7xN4kcQkUgzvxtV8062C9
	772i5l9Rt4cZ2cf+J03N3i7y60hraHELF8M+Q0cX5qZW4lKF9iuPt/z12iLy2Bcp
	NtFz3r+S7jAYfV0ewlMXIYEge3G+w81OuBSzmCojLghmxqnaBGlTKm5JJcQv5pJA
	TsB564+Xp9RzgUWeXiAABLywss986mGRmg+/33wfK2duCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27082u94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:30:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5939so178749385a.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782649858; x=1783254658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QMf4XwXgybpl72wB2JwO5JN4qSQjXQLTpvnjFvTGKoY=;
        b=i4FvhbeLx2w13KjPOrCKyst+1W7yZ5Ug9Ouov1/8LlQY1CcqqXryEDyv1MKId/5hxT
         TuqBIqrma21Gs7Js1I6Q42cOFhXOArUbjwa6+VO66B0VJxcH0xwdrcYWeatEdEcxYeIP
         1EcwBEyYJdNYIVsqmMWrIgwU/pEbRfj08e5lShZh7sqcdUgnAtHkX/Z7DxG/uEEvWTuQ
         jgVTJ9BL7Njcsn7gZ0Mwzf5DnciZVLKCrmP9MQNkqaigYqfNRQ4ilbF2GVWLTrmCRRb3
         Y/OE6sFIDM336hhzRG1ifNP81vkn7p5uG2RZdvDoQH2MWFuBeIMkA9I8BOnnE/jw0/5c
         +u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782649858; x=1783254658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMf4XwXgybpl72wB2JwO5JN4qSQjXQLTpvnjFvTGKoY=;
        b=QMdeQ7rLZhHGvZXdSkylSL73CARz0jHIwmN4Pv5QWuDwhfKof4F3FOYTJ7BF+CpooI
         L/63xuSoBCI4ThzXDkev+Os7EC2JDgPbW/GZy3DvcGyFVOg/2cQiHIHhUB4wrNvBe3su
         tipvifc6UJywo3rTWInkixhNnHzoARwzeMQaxSG32a7rbvpte7iBMrYgjXunTPG7uEkQ
         mTbcJcNILjkwJ5UL3SVAgDOMhh4Xy4Nl0yl4SDAP1tG+q4ULQP+4ZhLpl6J4ANNg4qPY
         lxSeV49TPrzaGWA60o7b3yI6vRi2IS1uB75oXocybSqTZpJz4r7FSR0b1Kca6FUg92Tu
         hk2g==
X-Forwarded-Encrypted: i=1; AFNElJ9c8j2jG6LIAnZ4LKT2rcD+LR1YtA/grlEa84P2oG+og8LQOTTQ/5UQylc3X5vOkrVnBs3QUQaWknLN@vger.kernel.org
X-Gm-Message-State: AOJu0YxLPeMYjH4VqXOR4BToYTLTzUxewhlYa+cNPqhB9qAJtDC309ds
	eHtxt99TMI5fIcOem2jf5aWZRuupHtyDiRjqpwx/OTvRRveno6WfqiSy5BEFILyh+MT3NWddneS
	Z+Oh0Lllcen19cvH8ty3iRsMkA7+7iA52l2WBEhGc1fk8S5iC1d96L4tNAnNxHP9J
X-Gm-Gg: AfdE7cmHRo6PzPQTkxI7Wwd7SfoHg8qPy54CKNSiVqRuvu/eb0l/cSQv90ehsKFE6Ku
	//7Ltwh/bRIZ2HN/IWuZSqgUxYRhqUNI14wDHFzu1EoRrF4bAlfEvCcYfc9UL6hBXSSqgj2IaS2
	aw82Dxei59qwyA0CyJOQYvIQycNksrMV91TY+dXs61jdd2l12Wl7s9DGAxM+TfbWJQhafDW7w69
	domQ0bqJ6XOFHYk1sAuH8DvatyKgqz78uKXuV+pWFt3T41cceTu4Z+8CSgY8etg7M0JTj4wjMTR
	lkqZz4kGu6CpW2uAzFAtpobPfyETexye/z6XdLKtPR/ibGWp7V8DQtjp/J34h6172X9k9xjyFPF
	xAMlE1QLizqrIl424I3X7ZklC5SW3++FOJfnPSp8yFKZDDq+ladqsR9DdfWDd4/xIogwZI86Byy
	NgeSUJwgfDkUvKayqUD4Ko1ixa
X-Received: by 2002:a05:620a:f10:b0:914:cf92:46fb with SMTP id af79cd13be357-9293c027a38mr1973397385a.32.1782649858098;
        Sun, 28 Jun 2026 05:30:58 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:914:cf92:46fb with SMTP id af79cd13be357-9293c027a38mr1973393885a.32.1782649857652;
        Sun, 28 Jun 2026 05:30:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeabb2db4asm1354862e87.72.2026.06.28.05.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:30:55 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Subject: Re: [PATCH 2/5] arm64: dts: qcom: shikra-cqm-evk: Enable display and
 add ili7807s panel
Message-ID: <pqhrgjj56nbfsfkzqttlivbxpdsfzn3ifmh5s6fczeiudlr36t@ts26c3u27k6n>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a411403 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VAIemredmIekkDCMH-EA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDEwOSBTYWx0ZWRfX+zkyDJ1wAkgB
 M8gprW4ClPYGl/vV+OOqHOP5JWDQU5ku8wxBCID4nK9cjB3g9tKLB56IGYDRKTfhDPKR0f2ThA6
 AxC3tbgOiSTN+8Ivm1mdE0i3x6uW/TytbKHWRkefnx8Eo8HEpK5UxgVqMIiCsaoRdjfuMZY/+Yf
 aa/M8yW0WL6WfH5pVgJk6efM0ZXeKOxWfTGCJuTkd1t3zn+s2x/TGewz1W2xkhvpqkzOWNRFBGw
 RnIP6UVxH2mTpjuCHDk7XYT6PYU6RoCTanmBUBT4/czijTkpv976N0qrc0hvihJWONW89MpSkni
 4/H74wjM9yJ+ZCSRioZHj0abiZSZg6ZiUXOI4I0/QB4upUygqk1PajRgT24mJwonSzD0Q2DUSb2
 XeHoFrlVljevW8MV2BO/VoWq/1jpeaW4uDpbfuAMyShsh5YBxGz1L8XiOR7hQSlSYbUCPtIhxIu
 jDOIc6tM9cHRo3tkEyQ==
X-Proofpoint-ORIG-GUID: LBmjDMBNeMIfMXqjs4u3smjqM1LoIZnx
X-Proofpoint-GUID: LBmjDMBNeMIfMXqjs4u3smjqM1LoIZnx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDEwOSBTYWx0ZWRfXz9bEZNrwSKYY
 ghiuTe68+NbrzskG1uG+v5yOirqynItfrksYNsu4f8sqT7uovGiIxj7yuYTvSZWhObbcSqza0o6
 NucgUFXqSZfnrFc1TND/R9R2dffBnEk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280109

On Sat, Jun 27, 2026 at 03:31:36PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Shikra CQM EVK
> board and add the DLC0697 MIPI DSI display panel node.
> Pin pm4125_l5 to 1.232V with regulator-allow-set-load
> for DSI PHY PLL stability.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>


Oh, and I nearly forgot. You are resending a patch written by somebody
else. What is missing here and why?

-- 
With best wishes
Dmitry
