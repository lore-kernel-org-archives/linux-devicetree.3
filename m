Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261579;
	b=eQ/7AwO9WnuSJPxPm8YIS3usNbfGFFGDtaa6jvacV369pudbjGq8+kjllFft9VdhjkvX
	 u0pF2QYtwsxbUfo5y1dF7wHrX0/29cfOqVdt3EZXvYZSO62qqQc8JKXRiwLwvxoeG02o5
	 fJMoQPH8rdfmWP3d14jV7AVU7LX9bfaQn+8fnubdywNCtdGThNl0aA0Rc5S6YS7dJ8niP
	 zrlC7z8pzBD8Kwh5/X4lRBvLNyxyhdipbu+m5n0giENJxCJxkr/c1xRjehmG6C0ti63aX
	 DFgCB2fIGHu10Oh3orhgI6zDIEck+kJ+dUU60QNMX0fjItv24XKzIkBPoOnrR8c8AZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261579;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0JHuIrO6HeQW90zGwb8mXlKmQS/KkaD9r735yyDrBqE=;
	b=vsJNkYs20wYPiyeo5TFg5CbrU0lSQbC7eU04j30z/PRo0EbqvTRwOHKfDMmR0svM15Hh
	 +wDAER0oake1WnlXjDnb8B0aq/E4E7dj5EQLcAsySZDqbbEkYXecUeCFiwME7E6W6DIsp
	 ikkZARIm+gqBY4OcWnP4TG7sQl9No9JgpJu7PzIyT+snw48RqAZ6DGGg5zS1CThQUJUiN
	 vZdnQln75Dzs7azCAWbex8KKEI6gucEFevBqlUa9aGBIfenjn5Tx4YJtXpI/baHerox72
	 Mvtg1LNO6MWNMef1zYs8Wlbht9GmOeXDYcRapPN9T8D50H8Ugg0uTFFDZHBwm5FGNtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ch7ENt1R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3wlStDb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CE6606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 21:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97CE6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ch7ENt1R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3wlStDb
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAWoU1062565
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 21:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0JHuIrO6HeQW90zGwb8mXlKm
	QS/KkaD9r735yyDrBqE=; b=ch7ENt1RzDTd0Cy7LxpzaWmCtj9d3F01+Hesh4BO
	N9/scIG+o0vWI7Afc0J/S+FawtUid/nr8dHGkwsttMKKFtg8PycXQr3b9blscG3A
	XQbV3K4sLckCt9xGYeyA3WDY3hv7aEeEEpb84ZR7LwXjZ3aIIxbMFxBUZhmUeiCy
	8an16Vyl773x2e46hibUyNnBozTfG5TanrEmW5CN6oNFZ+sLCeI/RUGLa8GFqwzD
	oCUY4svEPyRjJoR5sLCtgK/3LVqMUGdjTvLQHHoouKW0O57bUel68STegcYV3mTJ
	aSzC6kRc9wN4TRFfcI35Z7T9H3ucxJcD8HPtMZw3wh9eGw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydjbe8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 21:59:37 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-998a2b06e4eso258650241.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 13:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794261577; x=1794866377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0JHuIrO6HeQW90zGwb8mXlKmQS/KkaD9r735yyDrBqE=;
        b=X3wlStDbDzUkelKbfNuZ9htfiYQglqCloPyFrmv+wu2BNQziLEP2elRzoY3HEYIv6u
         WvI8fRvKuR85P4v+g/iF9NTEOLZApHNefT6bMlBnj5ApnfpMjs4WjB563P4LFHTrxrXf
         xJdOVbSsnMgb04D7Sp0XlgyQm6JkQ2WmA3BWtToLy1dmHm8Os/t6OOf4RSVWxX2V33ID
         mFV4PL5PX5m0ngfeRYh2mBjOqOYxVLUkP/NL743fRoOKiJVh6/rXBxfDNtQST2VfpgUX
         1czJkDbbSbO4YXcPAPaMqGKFe+nOC9xDVQhAvCl+Ih5wwWLgDQF+DAtuHDY8k+rVmoLv
         ipvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261577; x=1794866377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JHuIrO6HeQW90zGwb8mXlKmQS/KkaD9r735yyDrBqE=;
        b=a5ijzi9oJtLkpAMwhgDKBWwtbNbos6FzQ+QZzQAP8nrU4uIhZ9PiGSsBNdb0n1+NDN
         cgks0F7QzEA9iYyOS24/pMTL94xTi/GqSMy4FpJGal8Re0GqO9wgOjYdwR9xWC8nfyPK
         j9XVOdIzowt6sKkYfEPFGPx6pxGHSzQLlDzUEcRZG+1OvALNx6ORr2dw1EdzkhmuQyq0
         SaDE+cN1T8g3FREFwqa6ZydyiCJAOkr6qlZLDvzf6hIbAAEli9QD3EbPMYx7ggdpkNSC
         oo+62m1Y4kqyPuLVZVfkzXcxd4HvlpKD81LaH5VKGpa6n2JKdvmPtYKrk4EO3aagIrAg
         R2JA==
X-Forwarded-Encrypted: i=1; AL+hErH69g8jd9kXxwij+TMyB+bRtvnKHZvPfDBewjE/RxmQHvYgN4woR3j0fWKQ0YdicBQpjuIboB5Cf2CJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+q98Be3BHO0QE1jXE6sUx1P3jH1TICUh1XxoZibDTKVeodq+N5
	KL2OoblZ6MiN+BhV1pUUbnh1Jf+rt7AiLQzxce4UNGMyQDr5r5aNcA/LmQ+4BizmupNodeevc6y
	5v1hOjmtNQ8JOaZErsT1ACkNbKtL8Vn9Dv+c6vdQTG22LtcFuWaXVkLPHAW3dWbwAzjAvBKHu
X-Gm-Gg: AYBFou3HTHN9x/141AG37eZpF/5MWz/5MbicePstmCx3BRWHQuLh8a4uZx3BpL+PrOU
	ctMnIveBWfdr683BKePfAsLc8tOAyPzkwJsMv56OwYslREttRP9E97f1meAf1hAuch0CazfZONl
	BTTCFRdJ1LrWGpEbtj2Awl/Izuoak70xW/Aee21vp+pfPsrJdUVcAbk4878PAPrv1nljb6M4iOO
	fkfn4u0uDmD1M0SZgP3yjYlqsMam/dhpg5xrRwijSTdolknvAgHfH6knQMeT/ij7oVDqS2570ZE
	ryI5M0HhJaVWiq73P9Gjyt5XSB3pZQDIDPsQMkNZUidXvdVx5ikS3qqDDhyCuGGfGh8izU/8xvp
	HC4vXz7igRLdixNzbvjysAQQeGxCMJetaSR9gIRuiVsZp7+0MD/qQE/Tzn2y/LOo=
X-Received: by 2002:a05:6102:3753:b0:7cc:828b:41f4 with SMTP id ada2fe7eead31-7d301c3f850mr257643137.35.1794261576514;
        Mon, 09 Nov 2026 13:59:36 -0800 (PST)
X-Received: by 2002:a05:6102:3753:b0:7cc:828b:41f4 with SMTP id ada2fe7eead31-7d301c3f850mr257625137.35.1794261575843;
        Mon, 09 Nov 2026 13:59:35 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363e0019sm1354173f8f.38.2026.11.09.13.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:59:34 -0800 (PST)
Date: Mon, 9 Nov 2026 23:59:33 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC
 support
Message-ID: <o55caq7vadrcc6ioc7n7aplbyh55n63mqgno6j2mgcksrjzb35@ptnencuakeo6>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-2-f4a8edaac447@oss.qualcomm.com>
 <44e4ede9-3eb8-418a-b1f1-7e9dc75e2e75@kernel.org>
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
In-Reply-To: <44e4ede9-3eb8-418a-b1f1-7e9dc75e2e75@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX2Nx3NIw6qz58
 d+Pu6y0wTgkk7tM1QEjPFSfSIAq9aRInWpd8rOV4RsRvIyOqT1CC845VBeaU+zCb+sWIIf/93rJ
 qU+qLzcNYqzfyM50drOFg4UtKP1DQzc=
X-Proofpoint-GUID: lD3453dtv652nLpj43JjKPPdFvcec70N
X-Proofpoint-ORIG-GUID: lD3453dtv652nLpj43JjKPPdFvcec70N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfXy/cSMecnqBr5
 onciboCBuOPFQzrbh8TA1tqPDKVdYcubCXdIHF8TsTKK6xvGF0YH8tOgCZ2NOn631m1nW9HhUR1
 QRFNAs5/WKZed+vXviCMQx0bSNGkdwb/lB80o/vafMCYeTBaoAtCAOWQDWnK992AAPEnAiFOUPH
 26J4BHPL7V7i0QBPfxEwX0xxnuMZDbJ46xHu3b8S5FkrvrPKAV8ICGxCnerOjDBjEEVluMs+n76
 Q/jC/JiACoZq2zlqi78bSHlBiJ3c91d0ihSh3gu+xWYagVptakRhzdYikNvbhDLlLVoceELRXSs
 YCsE3L856Cy8swpSLCHbwlme37slBvTd6U4LRXGxn2ROoiHd5RgjZYVEFlLogElLMVW58MU9a9n
 ymqPRU1fs2/m2bdg7vYWBkem4cBFUoToPucXQVUS2YVyxZHrdoZMrt7+sTlFnQXIr1cRBP6TO2u
 6KKxrVdz3c2ka+6JOwA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af24249 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=5kuUbzVnSpjELaQO4TEA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090087

On 26-11-09 15:52:16, Hans de Goede wrote:
> Hi Abel,
> 
> On 6-Nov-26 23:01, Abel Vesa wrote:
> > The embedded controller of the ThinkPad T14s Gen 7 uses the same
> > register layout and event codes as the Gen 6 one, but a different set
> > of I2C commands. Going by the ACPI EC accessors in the Gen 7 firmware:
> > 
> >   - register read:  write {0x80, reg}, then write {0x80} + read 1 byte
> >   - register write: write {0x81, reg, val}
> >   - event read:     write {0x84, 0x00}, then write {0x84} + read 1 byte
> > > With the Gen 6 commands the EC never reports any event and the LED
> > and keyboard backlight accesses have no effect.
> 
> Thank you for working in this. I've been testing this and my own T14s gen7
> and also I've taken a closer look at the DSDT leading to a bunch of
> improvements. Instead of making these as suggested I've just gone ahead and
> implemented these as fixup-s to be squashed into a v2 patch.
> 
> For easier review by you I've split the improvements into 4 patches (attached):
> 
> 1: Fix Fn-F12 not emitting a key-press + filter out some EC codes being reported
> when pressing Fn + Fxx key combos which already send an I2C-HID kbd event.
> 
> 2: Add Gen 7 suspend/resume handling
> 
> 3: Cleanup: has_kbd_bl2_and_standby and mic_mute_led_generic checks are
> really just checks for the original (gen6) support vs gen7 support
> drop the bools and directly check which variant ec->variant points
> at instead.
> 4: Cleanup: has_kbd_bl2_and_standby and mic_mute_led_generic checks are
> really just checks for the original (gen6) support vs gen7 support
> drop the bools and directly check which variant ec->variant points
> at instead.
> 
> > Describe the bus accessors and event read per variant and add one for
> > the Gen 7. The Gen 7 firmware does not use the second keyboard backlight
> > register or the modern standby register, it drives the mic mute LED as a
> > generic LED (id 0x0e) instead of a bit in the audio register and, when
> > the keyboard backlight is cycled with Fn+Space, it also reports 3 for
> > the high level, so handle those differences too. Also handle the Gen 7
> > only events as known ones.
> 
> So about these differences:
> 
> 1: For the spk / mic mute LEDs, on a hunch I tried using std LED controls
> with a LED idx/id of 15 for the spk mute LED and that also works.
> 
> I did not find either way (REG_AUD vs REG_LED) for the spk mute LED in
> the DSDT, instead the DSDT ends up sending an ACPI notify event, relying
> on some windows driver to handle this.
> 
> How did you find that REG_AUD still works, did you just try the gen 6
> method ?

Yep, just tried the Gen 6 method and it worked. Nothing in the DSDT
for it either.

Re-checked just now: the speaker mute led lights up both via REG_AUD bit 6
and as generic led 15 via REG_LED. Since the mic mute led is already a generic
led (0x0e) on Gen 7, I'm fine with moving the speaker mute one to 15 too,
if you prefer. Otherwise I'll keep REG_AUD, since that path is shared with Gen 6.

> 
> 2: For the kbd backlight, again the DSDT ends up sending an ACPI notify event
> and does not access the EC itself at all.
> 
> How did you find that T14S_EC_REG_KBD_BL1 also works on gen 7?

Same, tried the Gen 6 register and it worked. Writes change the level
and reads follow the Fn+Space changes, which is how I noticed the extra
level.

> 
> 3: For suspend/resume the DSDT does have modern-standby handling both
> making the LEDS glow and setting some magic bit (which presumably makes
> the EC use less power or maybe makes it send less wakeup events if we
> were to make the EC IRQ a wakeup source) ?  This is implemented in
> my second fixup patch.

Squashed it in, thanks. Haven't been able to verify this path on my
unit though, suspend has some unrelated other issues. Will try tomorrow.

> 
> Regards,
> 
> Hans

All four fixups are squashed into patch 2 for v2, with your
Co-developed-by and Signed-off-by.

Thanks,
Abel
