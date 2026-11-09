Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207158;
	b=By4o/E56crFnW/LuKxVz771uvvfBX8u5DfHwciByna4NFzAfvJf0ze/jGLMe/9Fw6Stg
	 hkOKo6+owrr4P5HaUixQQkSWgkmCOvG33dJ6VM4GFI4qfCFxCTPhg1o53b6uvDN3ZlQHi
	 vzaJOkXo781VdqY4be+CDCTmZj3ZAu3/1Btjsd/s+RDHQYpeeLfSHU7msd5bn16pmtXH8
	 rTlFYDLhPgcHowGVe4fMQna0zgmt3yeLtgL5cZagehBfCE5vimMuqhOLF+QoSTKRbuPeh
	 QMKlPK5pK8ixMEPexfsO+ONce3AQTjtAxkUkmrs7WTZ+IV8G5gY5rV/kPxdjWqubjGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207158;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pYBX0T5CKcwvZAIN9tNQTOFk9tmHNlr1/FpalyNCLYA=;
	b=oMwdOhGIEwgy3d+3il/6nX6I8VB7a+uPaJbbNmSBEHXRgpCy1fQOIOgXhvQQ2Ijrl6FO
	 vyYlBfTfvUoeQWsHKYR+9LjpIvrhRiFSRF0nMWET5C4Y9+LA8jMx+n6uomEfa22BHEALp
	 XQAvHCgmBhrT/haM7xOdYTtZEa7CJqCg9ZPaAr6rpX/bStrUs1+5VwKA6uxLc6UU/6scj
	 o0OBDEz2S0tMggZlz90KZNDMUgZSp6AjDD9kLYR4K6+1xoaDLY1Xn1VsYIpBWadaw0vwx
	 l2MOiZxmoddXw1e7Impg0ofhPH5rU13gTXQ+tFYBL4Lb8cR2ocdZoJ8fO+ycOc7iRhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gINNI1pH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YV6BVpdz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7D0606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 06:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7D0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gINNI1pH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YV6BVpdz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A1MS3611089
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 06:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pYBX0T5CKcwvZAIN9tNQTOFk
	9tmHNlr1/FpalyNCLYA=; b=gINNI1pHW9CSMWKrDmmWyRmeTudBSCkqi6vz95iH
	CRika5aaeka7jG5OOoGFPXtdQFmIcC5vYetU2L4Aj8gwCYWVkt9r3QWMlza+b4mn
	xUJcHJxK4om9TzDnULvhndId7yWE50tfZo0famGN0tZUQIyjqe82BHN9rXW5Epd3
	0XlFslXaen/RANdzKp2kcaj7oo3fjemoQj+aNXgvUGItUmSBokbB6+za/REnINHD
	npfpBU9CW212d4OC3H65KSYhZmFlAsFr24dK3dwNpU4vGTgE6aBVBS1ixrmGwZqn
	RKEugSn4HljBltNWyJKO/fMQUqSh0FPMrO0j7yHCh2P9+g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnwhbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:52:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36fe0b57d91so677536eec.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 22:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794207156; x=1794811956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pYBX0T5CKcwvZAIN9tNQTOFk9tmHNlr1/FpalyNCLYA=;
        b=YV6BVpdzL0JyzulYm7zHFxWlCRmqRXo/fpz2ShEk9FF6LFYppayzZpa7NU0YTxX0Qg
         Zy9yCwk+rJulKxoeX++JUpp2YXXehiW+NJ29xgI30dbyj761PgdxbC3oID0EJkgUPXK+
         ITiZ2HyuAOQNNZ9e1bUzIW37OKuCyfmFk5V6cbQteNWgHdBnVSXrt/lJDVWyqqdbZ2Dh
         VJB7wek9yr7/yCxKr8zjUV3aeZSj5nIJLlhydAOA/gsey32e+Y9uYmNOvBjOWEsnKRzi
         tH8nbrkkxoboRWCNkcONZgBF1h3v1vkXdqyCerjI/nvZ/dBCAQflCaVAANRWkduUDx6/
         inUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207156; x=1794811956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYBX0T5CKcwvZAIN9tNQTOFk9tmHNlr1/FpalyNCLYA=;
        b=VKPqZVLDBXSxAhDxFhskS93ClySLbJRgzFs916f40ihIT7D8Mv8Q0DfZYYjFxm0iBb
         aTb25X4QaR9O8GbPhIXqaeXAC0PTw30uS9Nd25P3ldhf+w8Z46vXgojv377d654fl7O7
         dg9nIyvulEV8iNJnCIgn2PsTtcb0LWnhpzavFGUdQzDaN9XoNQ9W2ZW4jlgZaglp6Cec
         xZQBG+On4HUAdyQRrMBdjE02AI6S26/TLnIV04xkvRK6uD5Jj7dU55kFpFgfWj4mEE/f
         O+HjvVQsS8UZ8FNI7LSEV0NrSHd5Njt8WyFnyrwvRpgKbfpiLknjql9YPoYeD/JboHqR
         bPQg==
X-Forwarded-Encrypted: i=1; AL+hErE+CmrGGwgfKrtGQcTM0qykiXeGWJjAvp8phQFetTMszK1JCR4jNK5+/eAk5CipuZNwh095hlkSG5J2@vger.kernel.org
X-Gm-Message-State: APuU4Z+NoOy4rqLHEVTXLWXGCdNk13fGGBjXzU7smQM6vX5vR6Hhc5U+
	UIlOXC1cVOJA2V3YB1t8SmAT14exkohj3bqmtyCqxTwIWDeOKUkIV/POro/ImRZVrJpykHGk1iC
	LT0VqupHNNuAlwx2w2dxTeU5IJNGzU0V4Uzz8zc3Wq7jvk8WC115LJ6WqReLjegG7
X-Gm-Gg: AYBFou1Nd85xIGqjbCI4BuCyMdRDKiNuzy91mJE+3Gta+EDgOxpCsiyYxyhiBiKU58L
	vUcu6vMgWk43OHBlKBsbyIItP0y1rgpfIArr7BSmWu2h+8wNX1SvS+UZ+uscZ/y+ybEFvDvacU/
	gdy8zoaQXeCi7Vv1UcaY1iqQqRwAynJAQFwJITsWQDeNY84WgaoXiDB/dfzpB/36tLkkWkzDKfr
	it8SOctfBSG2rYCwgVMfTVrPnJ5SIVaLVd7H6lH5llLZjbJg4KR9sFDwxJp5uN22rdh8JpOIEeq
	kRwx5hAgdA4sTUQUvOv3stDXQs/Di1d8kXrzv6v36Ujptsft/2Ow6S5NfSKK8Rr+yAV6N+fdaVY
	xP73IjZY8pAtsGVts9VQz+a6dGzHbhddBEzGl9PJKb9f/IUNSVMPIf8ZGF9wp7oosVMvWbyK0gN
	gCVis=
X-Received: by 2002:a05:7301:231e:b0:351:29c8:643 with SMTP id 5a478bee46e88-37256bf5b4amr5850914eec.18.1794207155665;
        Sun, 08 Nov 2026 22:52:35 -0800 (PST)
X-Received: by 2002:a05:7301:231e:b0:351:29c8:643 with SMTP id 5a478bee46e88-37256bf5b4amr5850874eec.18.1794207154898;
        Sun, 08 Nov 2026 22:52:34 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm10502754eec.17.2026.11.08.22.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:52:34 -0800 (PST)
Date: Mon, 9 Nov 2026 12:22:27 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: talos-lyra-evk: Add display
 overlays for EVK board
Message-ID: <avFtq61Hwzjk2f7n@hu-anantiwa-hyd.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
 <au_BvH0rEKpgTpc3@zenbook>
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
In-Reply-To: <au_BvH0rEKpgTpc3@zenbook>
X-Proofpoint-GUID: VuyCcVRkQICQpJCo40BPkwHU8CcxoJgx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNyBTYWx0ZWRfX0IhiFgH/4mub
 whi9zweeb7QtbHU64HkBlc0z5UFBcQwjL1Ekju21fG7s20uk6a9Z/DD8GMpHplviPblBwYOq8y0
 fKKmr/IecageXINLg+zLGKqqxAcDivd2VLarVOWyy59y1/SQNLWJpmsInPUsq2ZjbbVygDBTqSx
 PEsne8FQrRW+8vO/fI02FCS3WUSA/XiAtlSeGPxtolng37YFopvIfy51cWdRrNvOFARtyEL4UIc
 HmEC6Q8Bqr1MLg3Hp4T07gsM9i49VtIhBcwsPleezal0i9DT+LEBLJajp3u4BHwmc6LxXhrwVbx
 yj51F4n7+I6k17eazMamOGM/8IpBH/Q8bjzN+DKlibGh+PltY7tUF+2Un4DMROPYJuoO2/Qv9wS
 6bplaEjGswzsBdeiEqXba6UFICyWh+n/p1lEVu6BUQQFr1njLYEl769f69vuZy0aEUDdp9jYgiT
 F/6VgfmiecvXdAeqK0g==
X-Proofpoint-ORIG-GUID: VuyCcVRkQICQpJCo40BPkwHU8CcxoJgx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNyBTYWx0ZWRfX99EYveBp6p0Z
 8IAQf6v3lrhHLSVKdszh5y/txTm1lWxwk9Qe36bqdJy63r8gF0r58YWOM5ZX2O6BZ6DXTuNIqRu
 HdK18DPupyHUlZHeD3oNuBvhXb7KvS4=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af16db4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Q-fNiiVtAAAA:8
 a=JfrnYn6hAAAA:8 a=YaO7I9Z_RSUIAtd64XYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090027

On Sat, Nov 07, 2026 at 06:29:41PM -0600, Bjorn Andersson wrote:
> On Mon, Nov 02, 2026 at 01:01:30PM +0530, anand.tiwari@oss.qualcomm.com wrote:
> > Qualcomm Talos Lyra EVK SoC card are mounted on the Lyra carrier card.
> > The DSI0 interface from SoC card is routed to either the 22-pin DSI
> > connector on carrier card named as JDISP1 DSI0 or to the DSI0_B2B
> > connector, through a MUX which can be selected by a hardware DIP
> > switch. There are multiple daughter cards designed that can be
> > connected to this B2B connector.
> > 
> > The below B2B display interfaces are enabled by default in base DTB:
> >   - DSI-to-HDMI using the LT9611UXD daughter card
> > 
> > Below overlay DTs are added for additional display configurations:
> >   - talos-lyra-evk-dlc0697: DLC0697 DSI panel for Lyra with DLC
> >     daughter card
> >   - talos-lyra-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
> >     panel with touch via the 22-pin DSI connector for Lyra
> >   - talos-lyra-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
> >     with touch via the 22-pin DSI connector for Lyra
> >   - talos-lyra-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for
> >     Lyra with LVDS daughter card
> > 
> > These overlays are applied on top of the corresponding base board
> > DTBs.
> > Link: https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com/
> > 
> > Dependencies:
> > https://lore.kernel.org/r/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com
> 
> This was rejected 3 weeks ago, so sending this series wasted both your
> and my time.
> 
> Regards,
> Bjorn

Thanks Bjorn for letting me know. I missed that the dependency had been 
rejected. I will resend this series after acceptance of dependencies

> 
> > https://lore.kernel.org/all/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com/
> > https://lore.kernel.org/all/20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com/
> > 
> > DT bindings:
> > https://lore.kernel.org/all/20261021-lt9611c-v7-v18-1-4978b94896f1@oss.qualcomm.com/
> > 
> > Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Added GP CLK Frequency Dependencies
> > - Reorder the &tlmm pinctrl nodes in the LT9611UXD HDMI bridge patch
> > to ascending GPIO number.
> > - Link to v2: https://patch.msgid.link/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Fold in the hdmi_connector port remote-endpoint indentation fix.
> > - Drop the per-patch Depends-on trailer on the LT9611UXD HDMI bridge
> >   patch; the dt-bindings dependency is now declared as a series
> >   prerequisite (see base-commit/prerequisite info below).
> > - Drop default-on from the DLC0697 backlight node.
> > - Add the ilitek,ili9881c fallback compatible to the RPi 7-inch
> >   panel overlay to fix a dtbs_check "too short" binding failure.
> > - Reword the PWM_CLK defconfig commit message to name Qualcomm as
> >   the SoC vendor.
> > - Remove a stray blank line and non-ASCII characters from the AUO
> >   LVDS panel overlay.
> > - Link to v1: https://patch.msgid.link/20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com
> > 
> > To: Bjorn Andersson <andersson@kernel.org>
> > To: Konrad Dybcio <konradybcio@kernel.org>
> > To: Abel Vesa <abelvesa@kernel.org>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Florian Fainelli <florian.fainelli@broadcom.com>
> > To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-rpi-kernel@lists.infradead.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > 
> > ---
> > Anand Tiwari (2):
> >       arm64: defconfig: Enable PWM_CLK for backlight PWM support
> >       arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay
> > 
> > Mohit Dsor (1):
> >       arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support
> > 
> > Shashank Maurya (3):
> >       arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697 panel overlay
> >       arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI panel overlay
> >       arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch DSI panel overlay
> > 
> >  arch/arm64/boot/dts/qcom/Makefile                  |  18 +++
> >  .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  77 ++++++++++++
> >  .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
> >  .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
> >  .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
> >  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 101 ++++++++++++++++
> >  arch/arm64/configs/defconfig                       |   1 +
> >  7 files changed, 493 insertions(+)
> > ---
> > base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
> > change-id: 20261019-lyra-display-upstream-post-24656268a902
> > prerequisite-message-id: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
> > prerequisite-patch-id: 0dfae1e9d0c620866489eecacb4b7201b9333621
> > prerequisite-patch-id: 94923ba8f57911649364a7e0e5494c7cfd478367
> > prerequisite-patch-id: 660755293839baa7364b4baf3a2dd6b4018de48a
> > prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
> > prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
> > prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c
> > prerequisite-message-id: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
> > prerequisite-patch-id: 37995c88387ff54737dc82eb7c3b4600901ce061
> > 
> > Best regards,
> > --  
> > Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> > 
