Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9652240D590
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782651751; cv=none; b=Ag6mhFCT8NfPU9ArsLKwlqKS5TchRSJ0bhglyM5fWPWlCDtjORek+oRn/hbltb2LGUPDycjHl7VFtoJJaYQ4raRIcE2v6xvPYtGYWg8Ot4fDr4GesXM8KEo7c1Vj0FlGTYBUmQQBPI08KXT9FRNDnRGkgx79l/+sUOcFsYU/3bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782651751; c=relaxed/simple;
	bh=BYhfDAJBD7alyCKz8K/MJq+iMMIqQysPyfqD5k89/qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6YIUlo1ae1gI3VSs5d/1gByME9XRpD0QDV2P9pVaKGqsvxJldZLWALmmyq4kbmQFgpj4lHdtTR/oiNyEjqqZ+tY9v8Gfpwr++6p9BdgSZBSDPS0dW9RCo++FLtdxrUNI5uQ63LQZ4l2leHB5H/BMUk3L4eAU1zxwztloku7Dhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8q9PsEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YczmY4jd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8q9PsEX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YczmY4jd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9Oq593594505
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JI9Cwp/b/lI8v0b7qdWxmDL9
	/uVPfttsUx/Fo4z5JZ4=; b=V8q9PsEX9ZnkPBhDwcFXejHytb8/00deRi0b/IP3
	0suSBOjClFs0rkNn9768IzQd60b/Gg3zP/O1XH7VOLoIpnUKwB7DmcK6HlErM8f3
	xpFtyOsZFCNCI8t74XyX2+Yl42hDpl3idTl5ikhwsNveX1qrVry9OcivpOAf6/HP
	5lMVtk4vswJQbQuvTalZm27CU1b3XB0/oC9RA6yTKPcHROeKNkpK3XWgkMBE96aD
	i4603bpB9aR1h2O8qIY4NOWfCtxc+1jgeR9dZkaHtFTBRvX9YLxIv3McnUnQFw3/
	5QeH7RuubjZZXYBOfT2Ww6/OaA6vOUtIBBtDfP7qZqOEcg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734ax65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:02:29 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9d2b22c09so86059a34.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782651749; x=1783256549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JI9Cwp/b/lI8v0b7qdWxmDL9/uVPfttsUx/Fo4z5JZ4=;
        b=YczmY4jdRtKLKVYCAMEqdlR84mSjprq0uasbyCjqyQbmq1J9nkiv/RHyebRDseZUZt
         D2ZdYGld7iLONKk+98h3ExdFyap34GdDlCFkJysXAG9IC5bzw2eGGFA26eH7DvSJycWn
         KOvY75InqXWZ2g9pyBb0eux2Y4P7989fWydkHwgIXZci0cpMa+BrN7bR9SqIOB9cfvYY
         V1VotWD9zSFY2txOhmqdWi9rVMbCWfdFTj+fPSfBXZmRLFRBN22ebm7Z5XNxC86U5q8e
         bx5BRVEFQ91WCXXxnhvYpU0NBsske0ujePW4EiOFNC3IxgU8Veh34bAKNHTK6DUF8ipM
         cDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782651749; x=1783256549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JI9Cwp/b/lI8v0b7qdWxmDL9/uVPfttsUx/Fo4z5JZ4=;
        b=OpmwtTOlFHwTk153PQulJafdI//122ZixJWJbELu3i6t17/07AoygoS2in8EH3VTe0
         GX8HVTLM0fzQwFoSTnMzA2rG6pkYcch61tJe3GgRxg6cRnOWb1+ZKJsWyaGnXwh2N9sC
         ZRE+nPU1Vy48XGkLU4E3a5bAh2e8bQOqhyau8/CzOIBClYrzzBbqBJviJkPoloyZiu32
         0t3nky3ZaBeThbCBoFzqffgoPJIaZl0lOmFWqzrND7+s6RPY3rqJidzMvzB9Yf/Qy6Zv
         bUgf1/ozEFlNr4EeV9m/fTgL1JJA6X2dx1Iy7HchQboptqtMDeHHhPZkpyDcwvbeX2Oq
         aNig==
X-Forwarded-Encrypted: i=1; AFNElJ9mCPVtgZpr3f6isD6cjJ0AL7nycN87FSsuWbiug8qHbB7lDBQNHZe3OqSsTer/6jrWQx0QN2mJtSq7@vger.kernel.org
X-Gm-Message-State: AOJu0YxDpuxBNcL+POsSGtITZwaf4GLq+IU2JvexBJ9ACBH4OCrFotI6
	gS0LQYEj2So7blRh96AQKQsXKAYuka3aOHN93Ff7MobI/6v3IolaV7+/lZOuDf6b6c3/8/OVKX6
	GXc7AB98wkH/VVEtYo1l8mX2/XMsBChemVARU5PpjeB2enL3sJiNvTUbN4LKt01nn
X-Gm-Gg: AfdE7ckhSUNRevNb7WpedRmAFGzd9dJTXofk4LDmuoPPkXeQB+okI48u3fH2f+Fjtse
	38mvYjMWVd+JHhoY6Nhe8fNWe0va03a/e3FGlcYDj4+AlFwOsWrMJY9wpwOHV6lrCfCPAveZW1N
	N0dJ4YlSaj4ClnfpzwCWqhN/ZsazQftDiauYvQa2fxfcU2ZP2Y8PnxgM7ctVUbnrUUX0mS/p6N6
	YTdWocT+aGrvfnoTGCLwPjXfnq2yheeiumw+OqlZBye4ThRz7jCkzEcoaSrCTCBZPPDRb4BEqem
	6NZ3xmosE5RY/XzS4UY7dY0puCqaGENb2u2CwuS89BWFnCL4zEh/+4BKKrkFRwCswteAmvuK/Uw
	3jl3UnMMB3uMoKJqSD0GWASnV6ueUX7HjFPOljAbEFqRVWtQsR1ahqq58vE9szLuVGKxp6u6rby
	zZ8sVMHDbppqzp9VdHQE+lHMWq
X-Received: by 2002:a05:6830:3709:b0:7e6:e349:539a with SMTP id 46e09a7af769-7e99c2de19bmr11894460a34.21.1782651748565;
        Sun, 28 Jun 2026 06:02:28 -0700 (PDT)
X-Received: by 2002:a05:6830:3709:b0:7e6:e349:539a with SMTP id 46e09a7af769-7e99c2de19bmr11894335a34.21.1782651747218;
        Sun, 28 Jun 2026 06:02:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2d5867csm2780843e87.16.2026.06.28.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:02:26 -0700 (PDT)
Date: Sun, 28 Jun 2026 16:02:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Message-ID: <e7bal26fyufjh2f4j6rh57bcdvubp3qqydk4pjagq3qjdz3ywz@wtfsiff726zx>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
 <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
 <20260627190612.27271-1-jason.pettit@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627190612.27271-1-jason.pettit@oss.qualcomm.com>
X-Proofpoint-GUID: MtHItb72j8Xl0Lv2tc3xK1HNNMeD71xx
X-Proofpoint-ORIG-GUID: MtHItb72j8Xl0Lv2tc3xK1HNNMeD71xx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExNCBTYWx0ZWRfX212J+u4gQuoL
 woTjtCfAKXf3pu9n2DwjqsSUh7KTFDoevJ04/LZeGlnWZFYo/kQQ4G0IpfXUuL/c66Lm7ODH9mZ
 +aTLexvntsT5zqPnvdYDIIBCWCFXrxc=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a411b65 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VSECHZiCxr0Cg4s7J8wA:9
 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExNCBTYWx0ZWRfX/7loyzv4pZOI
 jqHo+QTLRUWObClL8bITtJIRd7ueFiADstAm7MmlcStxJcTknRpzLMcVBfnSgphNt00cL6F8s2c
 WWgTAouDjvdwUKhyq6v5DLcHU/JeFOIi543uXW6mTnCFg0foTmHGHl2bq9ab6u2+GoI9eQpSW8L
 BgAFTkoK1ra7ARR1v0dwcP0+mk7myrX8/wd55Ip+7uwxgjYlvVu75IhS/+KhDc1SPVYKPuy96W/
 hwMAJMYuWVFfCcBjHOpDhNtx1RWslke4B7jYsnei35MVmx93EDRNeuIBL2/8g+Ev/3g3Hol31Px
 fHpSL6xfSs5W1KfVcdY8EfQKbwYDRGtRY5yHZjYEu1b1Hp2wS9v2/3vhpCJjrwtF9Y03wnXqG31
 D1Y6BGRLvV/Vtt+gia2HcsUNIUtAmX/wK9Tfjb0d6CGWJXE4OQuRnKKUDfRMoSKRP/8f82z/+c5
 mjozD//ExztqYF2cbjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280114

On Sat, Jun 27, 2026 at 12:06:12PM -0700, Jason Pettit wrote:
> On Fri, 26 Jun 2026 13:27:42 +0200, Konrad Dybcio wrote:
> > If you remove these two nodes, the QMPPHY-as-DP-only should still
> > function (it's the USB3 block that depends on the QMPPHY, not the
> > other way around)
> 
> Apologies for the duplicate. My earlier copy of this reply went out with a
> misconfigured sender identity from a local mail setup issue. Resending it
> cleanly.
> 
> I boot-tested this. With &usb_2 and &usb_2_hsphy removed, dmesg still
> shows the af64000 DP controller binding and /sys/class/drm shows the
> HDMI-A-1 connector as connected, but nothing is displayed on the attached
> monitor. With both nodes present, the monitor shows an image.
> 
> So removing them stops HDMI from working on this board.
> The comment in v3 will be updated to read:
> 
> 	/* usb_2's combo PHY drives the HDMI bridge over DP; keep the dwc3 enabled. */

This is very surprising. Can you check, is it actually the DWC3 or is it
some power supply that is being toggled by the USB controller? In the
former case it would mean that we miss some bits of PHY programming and
still depend on the USB host / USB part of the PHY.


-- 
With best wishes
Dmitry
