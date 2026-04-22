Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1E73F1671
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 20:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776888528; cv=none; b=taPqTnVCQEGJlh+3kBwaqMok3xKodoYsSPHUwfdARzMW0PAVfLEY8EkwAwZEmHJH2RUXu7Fv61+ku6fiFRVxEhNn1DsVTxw6xLB9WqTEZUeryIwSXFah6anmNTrkB/iNj3giFpQLBGN7Tt43eJgDExGsEYFPH/c5oKBqbyX/bZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776888528; c=relaxed/simple;
	bh=cvPZrsNX3AiMSJzsAhO6OS3+NTcfadIRaX9s0ELcXdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFXib6sLHSi4RBxLmkhi65wOuUkV/00C9GjN6rY8G+F/msBxh85x6e/PM4ETrHp2lrxIvIpenEK4tYPHyrHIoWLRGhE0bgPIG8icP4+FeqocVEuRivExRtYf5oiZYcanrniGurIwcSm4FweFFZRpIz/YDjQ/r+jGJYwOnelcYvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k436IgP2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZclzCN5Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k436IgP2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZclzCN5Q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFDL33664127
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 20:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jxwx/FL89zkqoEwiihjnYa/O
	UpNSdCgpzkNgdkiZ+YI=; b=k436IgP2FPXW5cgyPHBaxXfcWRk+SL7kC0THdfOz
	kanm15sCulvwqWRS969OmG9okUxw89X+OwmS5SXB9ggkGmTyRirsP6t5SuYOLvOn
	EFRSX2uy5vnKybOensydRhrUMafUhkGG9P/CWxBCRLkC63VAz3E0+kkSNySMf3ZU
	SY0CXfX9PvYcrG283gGrd5GbQJgEfmzAZn+QFyBof+h/5yeeeqEuUzO2hM3PDejQ
	NLPhxK0zCCNNiUkm5Us/Eb7Ic2cfamBK7JCr0OmPYS0LLlZNZRTmNxlP/hzPHzAI
	K6KyaP/zvjz+Y4QUc7aCaEDiUqSEGZrDbByFmwq+NnxqhQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgtdmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 20:08:46 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-953c4a80ff8so2431190241.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776888525; x=1777493325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jxwx/FL89zkqoEwiihjnYa/OUpNSdCgpzkNgdkiZ+YI=;
        b=ZclzCN5Qqf6BuaZeB6jYLbCJDPGYaYC7tLMhgBaaVmDf1gLr7jRygCgB8KfKOykCLn
         sVXcyi/SwXyMFUcV0Zm6tFNUUr7pqVQiIFc4zXrigiCJUZnoVu5K0OOqxJlJcQl4uPY0
         dVNL0vR48OtbB10JfJH8zzQp01BkKyuVrZ3/aNS9n3GzdhOJZGWpTV/G2Hdmqf9ZPsC2
         Y381gEUt0IwFIINkQxURfIsou8BWuKhi9MN5M+AkDDA68h9fHlw4mTX8jKW0bomnWIzB
         q6mRsgqJjHEGlIP3391ap7rwo9pPnsxnSCOQKcP5VTUL10symX3f2s846Gmh3kgKGvNq
         QKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776888525; x=1777493325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jxwx/FL89zkqoEwiihjnYa/OUpNSdCgpzkNgdkiZ+YI=;
        b=hPo7Urd0n3X/5rYQgtubOb45xE8WJGPu/Phzybe8jFPbTxo5/chrYDvhvqm9fjcPmq
         rcU9nPWG0FjgCAVWXMcyHYh7uYHOxM10zSm2qyFlpw+LxiFM3UNFKEXjq9TLDsPA2B/s
         B77Ahw4KMZFzcWPfByrKjvqwh1TN0na9Z0z6sW0XOuJS6kBr+9uit3k3BGvtwpE5kdsz
         Co94b72zFl0ZewH0FwNbb02NjC+t+uF/FMi/eU+4AiBgu3lWYP6GFzeiZ4AoMj4JE7ot
         XgKRMQ76Yh3DfGVQpI/UmMBh91sPM5PD/xCRKctDk1i5eVf1Ko5RHOb+Wcsl1tMTXxyZ
         Qgng==
X-Forwarded-Encrypted: i=1; AFNElJ+p9jAXVG5h3zcoWF044abXK++rTfd8zFv1UI6ZPa2i44kzjK4BuKRQ9mOavGpTZwZ3devWg5gqpil4@vger.kernel.org
X-Gm-Message-State: AOJu0YwG02obGtuPTI+bWrb0+jtzFJBXyeeedr4ulkuWPmbOqg4M/QSA
	NXpygxKFwtfB7cdlpPB4fxJx/uklewcHysxYqRIftytc0gi7V9XECwKvQdMf8vpcW3Gc2OUhtgt
	LjgnCKQGxk91w9fRSCCAp1zCGlxFW38B8XRu3ec/2Gs/jRmrRzCaBVEihXRhSkrFK
X-Gm-Gg: AeBDies8T3s1axT2I7cJrEcKRaGjdXflSBgSuHkXeA+CZhlzM0Ys1P+tBCX+NBT/kKN
	7xlhNhy0zE/g/Zge7md2Bz26sp/3xD/MCLjXZ6Atg1D16/0eMfpWLgrmTE4J207l/TQ35h+g3bx
	DNxx2TAiroRqE+tDhnvduNP475aq/4DWF7HLJEuJa7x8ydQbQUU9e0EAtCxjjzMbQuDsKTwkT2/
	jgkUsLAZiztikBT8MH+R6DrfwsOSjnBQSDlK1m0c+kq4vj+5kg+rAMBQxE/Tw8kduK6phoR6s9U
	nCqxN8gj3H6i0wB0LQTfGrQL+fiDaQn+G8pVZO/PCIDoAeElTxofL8MjBh8UriP+gAZBMLUFwJp
	nxhlPD91PEvhwFK5DSz+kAicSWTg4te5g5xLLZpzvHmJ+g+77PI28SyqmzgWHONL90HYggpVO2q
	fRiHzTo84Xea31rBp8R+fasyeQR8CZciHZCzx4DoYz/2Tyvw==
X-Received: by 2002:a05:6102:2c82:b0:5f5:40ab:2d65 with SMTP id ada2fe7eead31-616f80729e7mr12301272137.22.1776888525320;
        Wed, 22 Apr 2026 13:08:45 -0700 (PDT)
X-Received: by 2002:a05:6102:2c82:b0:5f5:40ab:2d65 with SMTP id ada2fe7eead31-616f80729e7mr12301261137.22.1776888524892;
        Wed, 22 Apr 2026 13:08:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5035sm38808691fa.4.2026.04.22.13.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 13:08:43 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:08:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
Message-ID: <dttcqv63qc6igab7zxlg27ckt3irmjnzhjgcvq6oz7ays4q2ld@be5kp4i433f4>
References: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
 <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
 <b0ec6352-164c-4492-a0c1-b29a07e5e7e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0ec6352-164c-4492-a0c1-b29a07e5e7e5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AGvytJy7rQW2spBBy2-FlLOAeJkonbIM
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e92ace cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=1Fljp5HRrODeMcgZaQwA:9
 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: AGvytJy7rQW2spBBy2-FlLOAeJkonbIM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE5NSBTYWx0ZWRfX21sDIUq8MS8P
 7rK9VnOKeiXiTkPey1lvDI3Sh+aTlRp5931vKa2J3y89OUoF0q6PX83CkS3BLf/taanW3IC3qdH
 BSynRIT4Gi5F386DmBUjAF9qfSYtX5+xo+i7avIQPbks1srK14uIltHdJIB3rJ0Iuuf/HvwA5So
 uigOKsqCIJyhtJIlqLsAZ43tP0mAxxBFdePPj4I7vFwqXbbrBcTH8Jt76+UTjIEaoi3DTF6m+/s
 UZZn4GZY2B5p5uQsw/EEhDKcjO0vQANOVkb6cAJ0jlruneqoHu+2NL5oH8ITwau3tD2NJ5EwWUG
 LKQ2tXhVd5Jh/X2fCXjPqK+REzLHaZGSE+SCsD6IcRjCgCoZoE9cCTq7NR7oRGiWvqhJlhSzUpO
 H8gWa3OXrL87uN05NXbRNdZwaXzaHWCPk/kbZ169Io3fHBdTBwUpsROlE2oBgwPmi4IauDV7u1g
 S6zdVskBGhtxYMHlY3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220195

On Tue, Apr 21, 2026 at 08:41:14AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2026 20:02, Dmitry Baryshkov wrote:
> > On Mon, Apr 20, 2026 at 03:36:17PM +0200, Krzysztof Kozlowski wrote:
> >> According to user manual / programming guide there is no separate PCIe
> >> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
> >> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
> >> is marked as the main block with additional sub blocks for each 4-lane
> >> phys.
> >>
> >> Describing the sub phys without the rest is not correct from hardware
> >> description, even if it works.
> > 
> > Is this the case for the other bifurcated PHYs?
> > 
> 
> There's more? Oh damn...

In the previous generations. I think Hamoa had one.

-- 
With best wishes
Dmitry
