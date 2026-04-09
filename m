Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D4D351C04
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 21:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769665; cv=none; b=RkV8igPo+YKQKIikGvgR03ElPtEzzs8yPhPIQAUVe+LngqV6dozthtmKJKCUmFVGOicUVgd5W8IoKPh1A3aIbm347hD0ZuNIUy5w9qPvpHshd2lj6MBwK8/9XN3VAoGKTqTXnGj8BxiRVnQz5YgEv4j6ZhHjU9mVKPXeVmZWx/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769665; c=relaxed/simple;
	bh=eCSmkM/1GUAKTYNm6r6u1P2Q+MwKpHxt95jNAcD5+mE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sVP2bMuN1pqVcgi1cmp8joVboVzu6acjdPJfJ1odvRdfRdMrDVC/L6Qe7mqwarCpvBWpJE9IVWgynpXg90cjPHiJqOFdy+uhLF2D+LFIbOLS+9IQKnhdTSzPjGB7bA1Z6syWWyWpg46AvVSCcepiz3sY8OVpKBiSuZBATw4qqK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=frtGo8D5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COVqVJbF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="frtGo8D5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COVqVJbF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639LADmM1729914
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 21:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DN2wFx6p2wCNVnJcSNzftWZ8j0GCyOvdQSpWKMBTDHw=; b=frtGo8D5a9pyM1/Q
	79i9cCgV//F7ALy1COkXTTYhspDkC8bKhAMWuyKunIMYiJeTiaZ3+9ojtT/7P48r
	hp0QL/TlBhvvFdu9nQ8wrVLIofrvwo06j2kODxHxIOuThEKZQd8WntZAEfM+faBR
	rM9ekLyrUUmzv2+Ny5/C+j7XdR8DH+aIoiPp/zqZnLc7ik3peglCvygOkknR1vJO
	JTe5JjfbX1n2QKERB+pS2mCmHulSR6f61GyVTSAz4Xe4GP7jnTsHQlM5HIVYd7zC
	zjbRngk/WiUDC8/K0KwFS3qzk17e6w2xg+VFmeP9CPuKvI33VgfzKHVQQp/t1eA3
	bnZVKg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxhqad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 21:21:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d63962d83so35654341cf.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 14:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775769663; x=1776374463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DN2wFx6p2wCNVnJcSNzftWZ8j0GCyOvdQSpWKMBTDHw=;
        b=COVqVJbFdb+yLJIvnLUXjQxhX7rvwxbxdxcgUTxOR4I+qLsU+d6Zwv+kKi4ZKptkT7
         FB66tPigNVGL/kZMiFnWqG1TTF7o7ktTC5joWv8NJBXlrx43VLKiuz6h+0Dur5MEQ7+3
         UYYjSGxwjMiZxwAGH4ynGRLUzhgmjLlFoHb45ekxSgf8zfP+VQcMbQokMnf214M1XODS
         Q/oHBm0ArdUOKqS9p/b76gDFeqkavKjICLuB9op9YFPgWP/KjjS6mZAd1qicJJpZRy0c
         ZHmBRdQs/CAzkUD8rwnJJg8KsjSmYjfR0Jh5kuQseKSDtsSubX/dP5ewgDnMJDXn2ANH
         BDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769663; x=1776374463;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DN2wFx6p2wCNVnJcSNzftWZ8j0GCyOvdQSpWKMBTDHw=;
        b=G0PTMg0cO1ycHIAqrgV9npM4NLOgCGzgD+aMmtID6snlDHMUUQLvPSCkA6yNz3chM7
         cLvq8q+EJwXAU0myokg53ZxifrDLV+dOxyBzmusfqFYFb0hwYa1GTXH54zeac88Q7cf5
         zbxtceYknnSCYFPcnE0wpGwGCSVU6vuVcF1q6mSs28pIQeRrNa0qgets0Zqg225DllMv
         rrIju+GZJKZ/cTdDwFijMZZbq/ybT2kTGJSho2QU04W1vbF75p2eQHRV1i09o1Wr0opl
         FbQMuv4ck1qhDYafgOCxwVWGnQiS+qGMt4IU4bsyhLN+cMcJaOnZBmPoboan9GQ0U1pk
         sLsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCIFCvOM6YmxNOmrpAhrMce1uflP1gW/eur/GVIbtYrFYQRqzppyxqxNKMPJ/mFoGCRxLzk68H7Ejw@vger.kernel.org
X-Gm-Message-State: AOJu0YyAYh9In9jR0Xox95duT6GmUSo1bqOGVZji1CFX1om4jIRQedCn
	55yvz5M0o36ogUuzMqjcovuWND73+SQZElCJXAziIupIxBiYUEn8Rr+crwFhMtZxSbNE2ikACFd
	yqpB+o6Eqd2MR8g33vJI94uUpiZlChImBmQr8h9FTlXes8Ey/ZonlG9QQnBmY9viu
X-Gm-Gg: AeBDiev+0SnmzYcO5zZvDWX8dbWxvYpSCukQ/Uh6AHNoN6GorB85KfKGL790+6mQvo3
	CR3dx4SEBbhBIooCg9EgeBEOT3E2gHIeQtnqfmrCUOvOirGRVRwgNfSx80ZJ5Ma/Bq0PGjdzCHa
	Dd2PiMrMKiH0I4q1ZkxYQJTCdUUMZPpI/cBj+64OHRR58EfZykrQMOi8j0oGf/LUCfUr0FG3CVi
	MhqzJDPqU/PYPT3oaxu0YHobCC1/t9mKQ40LGlj48r+TXWr4fna4+KxOM6FAXoCaOPXssR+XXi+
	d9sAtjVUO50DjNRJhdHPb8CrLSPeYTUSd7MKPiw+bxpJ3/bq0JkK7mDQNJDIuL2FU+bkItFzan+
	K3Q12BeeEdu4Rxtdje1y1ySkCcgrkxRiPDpP3O+4VDBQJUUtZELbNXHc6ocuHeYh301z8C2mx7w
	eXbcz7LadmJ4reeTfugAUjOqCJLW/yLWiWmjI=
X-Received: by 2002:ac8:5f87:0:b0:50b:51f7:c660 with SMTP id d75a77b69052e-50dd5cd70ddmr13597561cf.61.1775769662673;
        Thu, 09 Apr 2026 14:21:02 -0700 (PDT)
X-Received: by 2002:ac8:5f87:0:b0:50b:51f7:c660 with SMTP id d75a77b69052e-50dd5cd70ddmr13597141cf.61.1775769662243;
        Thu, 09 Apr 2026 14:21:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e48fda7a6sm1876381fa.0.2026.04.09.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:21:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Joseph Guo <qijian.guo@nxp.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260331-ws-lcd-v2-0-a1add63b6eb6@oss.qualcomm.com>
References: <20260331-ws-lcd-v2-0-a1add63b6eb6@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] drm/panel: simple: add Waveshare LCD
 panels
Message-Id: <177576966070.4179768.2416900967619768301.b4-ty@b4>
Date: Fri, 10 Apr 2026 00:21:00 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: TYxqnKLcb1ywCt8T1myrPgoJB80q6JUf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NyBTYWx0ZWRfX1ueiE5S4Iday
 imDcZhcbmbK/Oe0eB5yPBcN0JW6dURTN2ASw6wj9Q5XfY0AHG3jmBlmeuWi6HN+Za+7v+kHkU24
 uWuz2nsJlKygGGQ3T4eUr8zPSQQ9OVF8bgbOgJk8EBZulGohLoE7m2AL82FhjTv/RCiruIwdhfV
 SdfGgWIBeEuberAqrYcS5k0HbCEJyxeMRg7c7e/ftfYq5BfuUtRy8hmvZYvTNNZI/KEVRc8gXlP
 AqMF3ZsJAa21A5hBFIN2DtZfw5/laJML2tJR++wvoN+wNpMdqQt9xIeWDRTL6vYF46UFmX+FD3h
 0rKmQG/RlYp/8Wqvofyr4zKHW7HrrOe4RLePr7AbGyK1yhH3jD6Ve4u3FTTdpOKP3kia+ZXRyWR
 JD5L0wUwR4LGVk0xdpAnViUtEAJO5/8cKPe8qQZyuch03xtZwPUNHwgAueJbeJhCVc/XV1HGwyH
 Ic6IM2qthtz1gtsfVCQ==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d8183f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=XqiqF6kKystFwB6n1pwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: TYxqnKLcb1ywCt8T1myrPgoJB80q6JUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090197

On Tue, 31 Mar 2026 18:44:09 +0300, Dmitry Baryshkov wrote:
> Waveshare have a serie of DSI panel kits with the DPI or LVDS panel
> being attached to the DSI2DPI or DSI2LVDS bridge. Commit 80b0eb11f8e0
> ("dt-bindings: display: panel: Add waveshare DPI panel support")
> described two of them in the bindings and commit 46be11b678e0
> ("drm/panel: simple: Add Waveshare 13.3" panel support") added
> definitions for one of those panels. Add support for the rest of them.
> 
> [...]

Applied to drm-misc-next, thanks!

[3/4] dt-bindings: display: panel: add Waveshare LCD panels
      commit: 89bb9b36d3c49961743c97f3c25befd9a2f86989
[4/4] drm/panel: simple: add Waveshare LCD panels
      commit: bef9eeb62c47902f73a386a8176795fba5e5e2e7

Best regards,
-- 
With best wishes
Dmitry


