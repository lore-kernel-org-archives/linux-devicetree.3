Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DF534F46F
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534564; cv=none; b=AlabDYrIjGr7/p2C2lS4A/wew0H1rUZ3h4EP2j5FxPFrGwOrct90dsEu5RLezFQmFC9PHK51L6UHeNpt0Nmox0TDWTaJ1vTRuHXmd7BX44bTEe/at4PVFrEiyt5DsKvXQY3/x62dXhqacZ6p3GbhVFPGEAL83uVG9yQVq5gycpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534564; c=relaxed/simple;
	bh=JwCvDd5YzyK7COQjFOilO+tgzZeBuXPZW2kTiC91m14=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nQg0l52prXm+0p+yQgXFJ75iLOO7fRRCLKuuIPEmoZE+AuUxMLvGtQPxJHakx2Ip3uD78HgbGNgOY60C/F086Bqwjh3wNOMzPQVh34vANiwYVyaNzcufPDqB8Xjdk0CMMlwe0F7rA5+Z03jLfR0lBd6TjNLeFuUPBmO58pdMcRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvDTc0BZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PexE9nYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvDTc0BZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PexE9nYK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KMQA1223196
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 08:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Lfj6oSCKPER8z+P3DkIH58XgLvSuXtrBMTqgQC09sw=; b=hvDTc0BZhw3sQkyr
	kLrYI23ohlUDBErsLIm4Af6CvSE/HSU6Ze/XKZtwOFHdtozaz07r4vOQEGgSpLSM
	fM3UxiWrzFOzhvtFi4USRX4T5juE3F5TUm1lLWcW7+mTVOGEryu8DTbB0rPycUox
	fBvVu6pw3x2ngMbQVyTINZAgAB8LXoiyObkKrR60JchD4F5+uhN2EjIPaRKB7r45
	99qRoPVpNWMxxg/A2r9x8XBMU8lnna90ekEihJHWRNg8OzO6ypfoIqOqeP2AGqQh
	MuUgB62Mck2892KtG0Xk9W6Qr+828c6clEvBBimRvJ8AUyCl2Fxau0ksjPoaqDBn
	szWIww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkakem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 08:29:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso1150373285a.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534562; x=1792139362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Lfj6oSCKPER8z+P3DkIH58XgLvSuXtrBMTqgQC09sw=;
        b=PexE9nYKFlqrUr90a1+bqh5ZRfideJCGxqXv7qn4Hob3irfhjLgcGld2ps4+hHra4F
         7qAshmc8+voiwooKzqpPKfiE3pKATWozVs3YowoiUjUnFjv/rWS07Lb3/lxrb6CPItky
         eMJC2a8MI8sZdNW61A6g3nsVHAPGCegnYQkKP9eppcY6qeby6oqgeDOtpdbfB+lRb2fI
         00H7HNYxqz6kXdznvtuqy3pnm/HXVraKysadt7/dncOTZ1KkbqhzQ0wwcAjsp2rFzhF/
         4sxjhBGmlG/8+ejGvNdkCqWveV0Z2sJYRn/JOHF3XgHdk/igpyaO4x/PyFXyUx7ZzSbE
         hLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534562; x=1792139362;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Lfj6oSCKPER8z+P3DkIH58XgLvSuXtrBMTqgQC09sw=;
        b=sN1o7DHgBF88dd4Z4dKthroYeUCpfdvFn7RZbpX0DZ8DGNpz4EL2qgjazfXHYpoALf
         j4AAgGBDwuzRfMC6HwXeJxnpY+4Z7G/hCSrEBam/d2JcS0TjeX8bhA5eEI+83zvySJeC
         D2KbRjzmLIBixv0Hb2r7/hlr3af+PNZ9Nod6g1xFM+JWWOF4ytqO6mTfHiAhUt1RTep7
         WELjWXavDaco6yMOpcJy/GJqkuylU3KwlQ+l4lnsXi8ElsQdt3c5jyLhgheeriJtSbA3
         7+3WwELxOR/ue9DcB8BQa/n1Eoah3/pP+Rm0iN9h7MeEoNBf+L3d7viMAqSdBsdn5qlr
         Mj5w==
X-Forwarded-Encrypted: i=1; AKwUvBzODa3TLUgvkdSKKdJSsfaKRquxk+pj9Nxz/Bcc56xF2SqlefRn81HUAm0i65UG8936u3Iu97KMY6+Z@vger.kernel.org
X-Gm-Message-State: AFuF++mOZSAVuRyEY60e1W7Uo0oG1r3skAttZtIOAdB+ixi9kRpL5VZL
	fu5TtiXk4VgeS1N3JnSmxheFeF6zFmPtuH+vHQnPNmewwlWZhlaa8/5PkF7NygIKpC6EmO5gIU7
	kK6IjOq13Asms57A9oRQW8a9jesYE9Uq+0LeM6MF4BhUn/irjsaLy4nZP8WfqLZjX
X-Gm-Gg: AYBFou3PCc3y3I4XZVCglasslHjwt0K8KXgYelnoqkMtN0OZFfpv0QS6wO9NkFB4kwS
	1PdE5gtRAVyhIZdlhaCvvZGWbyw0sjKAuV1cgCaChCb2oego+lGaWHTh74eLOdnaGp/O4mJRUKv
	rDBh/dov47nVLW2dpZta29iF6JlqwTOwxi6pB1vALSFlxu1Rze8O+rSEDLvQf4rAmNaBEYL5l0F
	sJoHc1+eliqDi2TrLX+6l6tRJWAooz0Fj5kzld5mLlLLaCTA2H6vJK7y5Zs953c9LHG8GJrdbtW
	8819iZed+hiPYQn1g06BmRm7voMb5sRbOVOUx8eokWG/pYaJ5RvL+3G778mctvfrSGH7pedU5wM
	BTfllhkgBdoON8sRpqzv7RxvtXqWwwXziwSvSyU3XjHoxOZ/WG29BDDhPf9BHkUqxY2NFst7zoL
	kZVC5R77/xvX1a
X-Received: by 2002:a05:620a:8088:b0:93e:c12c:f11a with SMTP id af79cd13be357-93ec12d0581mr47265485a.70.1791534561562;
        Fri, 09 Oct 2026 01:29:21 -0700 (PDT)
X-Received: by 2002:a05:620a:8088:b0:93e:c12c:f11a with SMTP id af79cd13be357-93ec12d0581mr47264385a.70.1791534561145;
        Fri, 09 Oct 2026 01:29:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3caab0asm4295171fa.18.2026.10.09.01.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:29:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Xilin Wu <sophon@radxa.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
In-Reply-To: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
Subject: Re: (subset) [PATCH v2 0/4] arm64: dts: qcom: Add support for
 Radxa Dragon Q8B
Message-Id: <179153455955.2970577.14103639336377928226.b4-ty@b4>
Date: Fri, 09 Oct 2026 11:29:19 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: ZICgOB0c9HZ_OoAn9CzLdZJxwKAaGflK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfXznoLKTSGMYyn
 E8hgNnPn8SE2m5UuLl2FGqjHcMbeH8sYePwlEqX25zzFcGPcnZfaJTRRq6gJMoLmQXMT6KU90fg
 vjRj8Gd7L456ABrRHS3Uhcwb3adHd3I=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8a5e2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=qk-nXHHSopyJew9tVzIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX4qIdfLVD4ake
 tE1vl8oxLeZ7pLgIyVadxjSxilmCWFgUEQaRmqys0xP+rZtF0rZnxyhgMJthLE36ycE5Ze3HqBM
 MlLV3AZhBwBrsyCRcFRctneesKGxU+FN91Zj6IEafuCvSySLih/IKiT70C4NYyW1PbOrmCs3lM3
 5Nx6DiBsMxXiB+xgGuJYaBwTMAS9zocxdEjUan3UsRVzIFWbtlaBUrWcHODC+8Tqhok8445OWeD
 cAYiqsXiH5YNf54szfphd4U18EYlIPjEL2LQvbX89L2upSjAvZW8UXj/nuSoEw3vxtW587OyKRA
 QdfYCfmW1TyPXrOGtA7mZSXtHvyQQuw6IrIGX1Ur67db4bpc7R5p0Ccw9XCZomMemQRKh+gIeeU
 SToJG4oayF7tL1IerjyIV8BVc5CnjRr43zMnfTG3BtSkLihvVAn2Ykr5Ka4KAgQrBKvMacmERNT
 rwGnDhujGRKmk1grrWQ==
X-Proofpoint-ORIG-GUID: ZICgOB0c9HZ_OoAn9CzLdZJxwKAaGflK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090032

On Fri, 09 Oct 2026 15:55:05 +0800, Xilin Wu wrote:
> The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> Snapdragon 8cx Gen 3 (SC8280XP) platform.
> 
> The board provides UFS and microSD storage, two M.2 M-key slots, an M.2
> E-key slot, a QPS615/TC9563 PCIe switch, USB Type-C ports with DisplayPort
> alternate mode, USB Type-A ports, HDMI 2.1 output, headset audio and
> a 40-pin expansion header.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/4] dt-bindings: display: bridge: simple: document Chrontel CH7218A
      commit: 377682cf917027396211426c509cae5785305ba8
[2/4] drm/bridge: simple: add Chrontel CH7218A
      commit: f146c6086b792cb2c6b3ce5106f0cce62e408df8

Best regards,
-- 
With best wishes
Dmitry


