Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00AB42FCD0
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784187; cv=none; b=Jzv8/rCgMiJtRKdTiwJEUFyWstSwdevFPjXf79OAjyWhGhtJqZ6WffYeCZ8B8Ai3iNYeCjAP1EGERjGFDBeR5N1+amHWz2pRaZsuQofbQ5+Hm0MFxhifixPiAEB63N15aGvIz+SD+0VbUwL+a4kDFuxGlSavI5YIVf6Wr0Xor+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784187; c=relaxed/simple;
	bh=Rmmd8CUZrD78yp5jRVGRccCxdhlc6zmp+lGG+y3hdO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsHYf/+fZ/g527hF69amyuFqzbFAZ/g9/r+tyV2zm5rE062V8L1e1IRQSdGLQ52CYCAIOsKGWFNaokt+5lM3Cr/kJ50QuIYTpHKdtYIvuwmsjO9JYu7Exa5rtFRC6TFMxzX7Hg7uvQByr2sUfUTXIV6AAGBwiW988zBV3xbboq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lD42B0K2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W47+qji8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lD42B0K2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W47+qji8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Gvugr2393812
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 19:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rGz1Y18dNb/KJayXUCubJBtB
	boeTWds/Oa3F5Jt8iv8=; b=lD42B0K2m6dfc7LWw6YNsNbUVPlGXSCKvkqOEzFi
	SzQcaL+ZJAHyKrQYjDuGaN7Pvk7WwE3Qr1/Znix5vc5qEJ7d4466SYRSTWKTnhlA
	8U99Qpw/Bhe22Y9ORrCH3b2ixsmXQ/vMMsFr5pA8mPFcMcgH0Q0sMf6yO8Hdoprf
	CYf/4pCAs66Ggk0GfXdtN+OT/85kPfVsxIriAT47z51Ca8R7Qe72Dmaxp/MUjATy
	KEKc5pXKaUBwxYyCEhQSDSpCSqHd6shPytUnjV9+j0lIaGJidxYmh29pz7DIaA52
	0lYwnyrjntyDF1VVjxp1NPg/3bgyKjaTIo/o7drldDb85A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftwhds2rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 19:09:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe3fa93bso35660641cf.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785784184; x=1786388984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rGz1Y18dNb/KJayXUCubJBtBboeTWds/Oa3F5Jt8iv8=;
        b=W47+qji80W5Z0I3S3VynSGYbqs5YLdWRHMyDHaC5sALW4SQ/Wo1Ds7/6y1HwXm09kq
         vzMU2gP9UG+QztRyZrqf9YsZLAbxG6YWFZdQ+iX746GP2Q8mkjIU4ymYjEcAorhVHApA
         cd/TA6F+700g162JDlbEFhqQyuZxX4hRRDuhhl++LIMVUfVGgfW1WtBwcn0Yl0Glj8Em
         K4wzGtHtThb6+FURanptL0XYHn007GwCyOCppbWOmIRuo3LvnjpzEug8Qa9mXqyUI0Hn
         9r/22iYh+Ooqy/JkZsUrw2iVLquutXEuIey1A987RvEV7U55aA9ZNgdyph6L23Cf8nF8
         L50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784184; x=1786388984;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGz1Y18dNb/KJayXUCubJBtBboeTWds/Oa3F5Jt8iv8=;
        b=ZECHt2bD5LonDVIQJf/thrxUvWBey10x+VrVSNfJcG87fBZJ943w6Hv/PxqcWjAb8m
         hAZPpX5pb2hF/bVS1j6ZebwWJm0zVxz3Y3LU4YY3hAQgxlcpwgn0ZFCRm19JPGgIGqYr
         UmDOmXg8vGPaolNfS52K1z16+vcQTmLd2/iVZJc/6COjVTzTZw+A9tUqtB9C3/luf+/5
         s1WdlvKejNXRDDK8K/KT/KqK1AFZ01PazS3bxyU01qUbhyJ0UUgWt12D8xOBHzGWCFaO
         nj3b6j5Fg6BJ+msk0QZ+CP39VI/UHovVwuHJMaGMTRCu5ytANASpFQwR2Itdj0mhEtQ9
         LoDg==
X-Forwarded-Encrypted: i=1; AHgh+Roa7uRCLr9UuscHKDNX7U3exo7YtCJlg/0a7EYDpWh5KjNrh7+ttzZbgoFb53VlR+cWm11iq0FivAg+@vger.kernel.org
X-Gm-Message-State: AOJu0YxMATC1hY1ZZ9Js83LgE9NnBP3lq3gjn6+14NAnzRrwtny5Lnmm
	j5w21P+8m6kvYP4gYPtELH9ghBqfCZ2TDggzr/rylqMMKaFJV2Vv7rEcz5LsrafeN0i8Rd3LjIV
	0puWs0nT67VHaLXdM9PDQwunT2ZaSafyqqAiZWMSuU4Wj7lzOMsx5uLFZ3WVEJcXS
X-Gm-Gg: AR+sD13bNEqaN4P/Woh56gtPR/stWt/JZpZ8zcn2JxLxBE4+CgLUFmj/LkujKVQ8FA7
	M55yR484pKnj6NNZTX5VMlqWCfi1zPXtvjltHGEofKA/IZiFI+aUy9oCzJHzkuxggxWdDyuvrW1
	GLR5ZKFzs1qmSJJ0s7fTDwuH6XSX/kQYYTzlnpCRUCsOWgU1PDiVmdd0YwgNbbndbyg8PDaVLnz
	EQCpZVx4xO54ruRegcXUhkgk5476ucOP8zkCHQkF/nVvM5XdqNl8d+8KKFXGsyHVTTr58J6Bo1U
	4hxfeVcqQw8ikGflEjQgXiuttL23V/BqrfhQVfDo8Y+Qchr1Z+28SrOw8TAm+VYPuPAB1eWt74V
	b+s0hQUfvucS1AWu4b75YEfHG4MZdy9dRmdPxtsykUiD8f2L0BPMbc7id2dzPqfchUg/Lm941m5
	EwC28rs1gt0lBC0A==
X-Received: by 2002:ac8:7f45:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52b567a8c0emr202339891cf.16.1785784183887;
        Mon, 03 Aug 2026 12:09:43 -0700 (PDT)
X-Received: by 2002:ac8:7f45:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52b567a8c0emr202339351cf.16.1785784183434;
        Mon, 03 Aug 2026 12:09:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cbee2sm2211688e87.29.2026.08.03.12.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:09:42 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:09:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <mpiuqkxaq4bvz4pc7iug3aoar5jkxz4tpetbg72olrzfar4zlc@w7sgfwfksl4r>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <qje2bZKWSzkQQGDw0traOE7SqoXhCBLeDrilCooH6Vh6cYeFWAh_VyhqspJuzVs3iA4ye2U75aZHsVGorNPjPQ==@protonmail.internalid>
 <476aee61-015f-4793-9be7-a102c1c3e811@oss.qualcomm.com>
 <3e8b2574-eab5-4c34-b400-c75312b9a772@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e8b2574-eab5-4c34-b400-c75312b9a772@kernel.org>
X-Authority-Analysis: v=2.4 cv=Zf4t8MVA c=1 sm=1 tr=0 ts=6a70e778 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=oQmaG_OvwICbMNobdCMA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ngUbZLqAiAUFakeHB5U24ikQOyqdD8Q4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2OSBTYWx0ZWRfXwy/7jIfamOYd
 q6JCoiiSx6dVgXG9Tp/3CEZfZFwxrk2DiUrOkj4XmiI9CqchqdcTUJTRnENKB0EWMZVoil3EDl4
 pNZa2jFpSnjbZTIqoLpzWxUbQSNY0heEeXOnHvMbx7uI+XGJrU43Nj/nBmoH3VVgLYqEZGk4oGQ
 FHEMXeymRnjUbePk1YaZP3Oxm9kpLu8ZKxZcs2HLBn32kZEZQ9m1vUz2LuqXbc1fjsjc0QIIEzz
 Y6WrNF/qrD//voamym7s0glhAVNDthR4d0Zm/ZggKAWqZJlfCJU3VqhAxDUuGQL8SBH7eeVXvFg
 r1wP4dgE1acIuq705aI+DM+r1xYX4UrD93pr+axQYFbR8L7CKA1wC8Txg2DMrNUGqGWdBoNiA5j
 9ztQsbBs04n/luKV3knfAxWEwYupUf/b+ZqD+HNbpGQ5rljCb7Kjr6V5+u0On/A3NhKEg2/eLfr
 49xIx5I0MTdL95uiJHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2OSBTYWx0ZWRfX/+fAnXaDftDR
 +Hqh3vaC+frDY3V6OzRbWl8cKf2jk0npAXIhVZinfd0DtVKGAIShshBYcGqUWzAFOA6pLRsZE5L
 oSfVOOgrCqPhvHHz80c/FuPTV2el6vo=
X-Proofpoint-GUID: ngUbZLqAiAUFakeHB5U24ikQOyqdD8Q4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030169

On Sat, Aug 01, 2026 at 11:04:10AM +0100, Bryan O'Donoghue wrote:
> On 31/07/2026 20:30, Gjorgji Rosikopulos (Consultant) wrote:
> > > > Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
> > > > please drop separate mmcx vote here and let it come through the
> > > > titan_top (it might require camcc driver and node modifications).
> > > > 
> > > The change was requested by Brian, most likely in connection with
> > > upcoming migrations. I think he would be able to explain the exact
> > > reasons. As far as the facts are concerned, this is not currently
> > > necessary for the driver to be functional.
> > In the documentation we have this jpeg block need only TITAN_TOP_GDSC power domain.
> > However Bryan request to ad MMCX and MX.
> > As i can see same is for csiphy. Maybe is better to sync with Bryan.
> 
> Check hamoa - I believe it is the case there's a separate vote required for
> MMCX/MXA.

Assuming TITAN_TOP gates MMCX to the whole camera block (please correct
me if I'm wrong), why do we need a separate vote on MMCX? I might be
missing something here, sorry.

> 
> I'm prefectly fine if all that is required on kona is titan_top_gdsc but,
> basically I'm asking _you_ to go verify the difference and come back with an
> answer.
> 
> "Not required for Kona we checked" - its not about being asked its about
> checking what's actually required, I'm highlighting this because sm8550
> perhaps and hamoa definitely are different.
> 
> All of this is in the power-tree documentation. Please find the place where
> the power-rails are stipulated for venus/iris and then check to see what's
> required for the titan block and represent all of the necessary rails in the
> jpeg@{} such that jpeg@{} can run standalone without any of the rest of the
> block switched on.
> 
> I'll trust your diligence in that.
> 
> ---
> bod

-- 
With best wishes
Dmitry
