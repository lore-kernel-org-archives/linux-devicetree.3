Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947D83B71B6
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726480; cv=none; b=DZyIn1T2UeIiVx48XK68jbvX7XdxKrkQXxxgAO9wyDPwZeJLDY4hnPH5x272uT55+UFDKCEmNYhuEtwCxnO3Mas+ROse4TgDnNxLyr7Ad277Q9+ZUwxi0FZHxaTsuIngK7lCTNpB1RvRzpfYq0wYHWyILyR+7wL3IuODvNtyE3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726480; c=relaxed/simple;
	bh=3sKb5hAqpbFIkaMDbntJpobi8ZtCNLD9OHyefQBz9zM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/Z5gU9ak9jx8Aw4OfvM/liC2TqvfiQeKSS+6wsAjBEwhxrtlNv0x8FCZ9xK9rrCcx8j/wAkXW11Umv5UPTDbHnQSDciZFeYOYVniQfx/ZNJT7pqf66M9ZVsYf/5bpoXajL7XuVV9/d621jxxACmYj3aDPG4wCgvG32Cnqq4X70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLfEOkqD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFvRns/v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLfEOkqD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFvRns/v"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T72aWL2163917
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	udELQge8o8Cc8LFf2Bfb3cre20OMyZXNF1FUTy/8J6o=; b=FLfEOkqDf4Odkdjg
	5T+TlfeToR8U9JrvZO6jjRMpbVu7+/QbFg2DzctUQsIm1TrsPwL2BF+gqmgpxw69
	HFc9W7zlPD+ksC1fZ0AM9KjV5Y0zSWRUSmvNDE20c0CvXPTMwbtVu01bUQYJTIwG
	qsiVXnS6RrkHJJX/smUceHKdtm6roS6H2BI01GoCVxIpwZUWN8wpRV4XF2kIC8dy
	7ihW/DkO/Xkj30WmIKYG4Cx/cGEQX3U6r/WCaYpiN7ijcP08qbhpqNVUgurAwb0j
	JGV1AHqpzrDuH4oM9Jp/uMzmJk2rCsIH+szIENyRNu149Tx9dm/ze6/3FYiHpitc
	h/DfsA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgp0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:47:57 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cf9fa331ddso100522137.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726477; x=1783331277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udELQge8o8Cc8LFf2Bfb3cre20OMyZXNF1FUTy/8J6o=;
        b=KFvRns/vF6rvgpQTs+LYDuvCzGU7NTC81joVcyUu11muAhbv/iKhX8k6edFETFQ8YX
         DjdJpwlE+d1F0ApsolRSO722UHe6QumqQt497QygQHDzA4UIxCPwsKosx3Ie+dAOkstC
         GUdAoesWQBnooASnv8a/y12rCVjZLtcvBMTrCgK7ne7CHAzWQCBN2JdpUmOlrXl8EU1v
         HTLr73e5g0oIn7kxYOaiEnTeVlBUMwxXlDD33TtskQie+pG5ImzY/g6o5yTqjACXApq/
         TuWRDoB2oJiPmiZTdPBMf+qKy8CKzDhL/Y1NT8BUzCZa1+xMPNNU3jzGzQOJd+wB8aH3
         NGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726477; x=1783331277;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=udELQge8o8Cc8LFf2Bfb3cre20OMyZXNF1FUTy/8J6o=;
        b=iFVvx2s6OBmItSDuRIAHBRGiROnp7otmFqYgVBRlEIElVyfzrE8naXBwswbXwrdwID
         QJ7KU6PCYlTdgFWHF8iuxPjXF7NZZqNq/m6c8bv1pDboSG9BnonsvD8Hgh5HKbQfWXkc
         lj9yKNlKcmyBxpTP282jI34me4psKpAq1bJMxEdi6GmkideIn4nmDaYMwSPSdcTi0iPh
         Qy0YTacgxGiENNC5cWJ8qTUcqfSyqLlIaksPiaYf0lP3emTFOHqWiRJOYgOP8Wc9lHYp
         9e67WVQXl1QBI5gH8TpZXnbds+KEc4qsy2FJB8gC4TvMJpQtrVGEw0pXdJcmJiWk1zW+
         IYyA==
X-Forwarded-Encrypted: i=1; AHgh+RqObd7sFWIsnfHfoCL65WinVwivYYVbvvekmx504McvpgoEi6CcxMpqIBDoAU5L6biPY6Wgh95izzRi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+dGshiTRfNJ/05YCV14WlHiKYzI4ds2vNtN7rnJw60+eRv6AN
	QBhHrgwZNExhLDO0C5NG5ysI5ulo/JdqZD5+6ykm7P2gzVWwzIuGKvN/AfQU7Bc/WQ2ayfQzVC0
	wvYu6TNPIPxfTrvRrCxZFhQaGIue3NWIwqzMxkmBFnhJzUHixw4s0PXkxfLXI1y83
X-Gm-Gg: AfdE7ckr11KmCAdnIOzS/OKXORzcGgCrObKdwqvV4MCxc6Mow+VVo0ZIMALmk0qj56h
	8CmPN+slppvvRmTsOkY/VmjgwWTQoAIEm+cJKfKFQ5owcJQ+jUZwe+KFgPWdHZvymVlziXzbn2p
	UF8OA6Lqju7EXqM6/bPnbCfNj/76vux7voDXDFB1vOP2V+wDh0BiK4uHZXauWRB8KO+zCiAvDau
	G60H+imdCzyAJlRymMhPVXGaFPUtSK3TF/3jy6TLIDzK+P0F++FmANjRnHsA/+BY8fDqvjbPP40
	ZOLh/e3+gyg/gv1KHAgnvyaRymhipDAYJy+7Gpu5UvNUhk1LLPySj5ADwKyLKvjug1XNM/Dn+t3
	2+yVT7HMw3y3Dhdz5Lu1LZYNFD4q4P8TrcpE=
X-Received: by 2002:a05:6102:3748:b0:727:1311:19b7 with SMTP id ada2fe7eead31-734366c149fmr2247569137.6.1782726476775;
        Mon, 29 Jun 2026 02:47:56 -0700 (PDT)
X-Received: by 2002:a05:6102:3748:b0:727:1311:19b7 with SMTP id ada2fe7eead31-734366c149fmr2247554137.6.1782726476317;
        Mon, 29 Jun 2026 02:47:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd36adsm6876708a12.27.2026.06.29.02.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:47:55 -0700 (PDT)
Message-ID: <159cefa7-63a3-4b94-8d09-6b652002bcea@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:47:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
 <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
 <20260627190612.27271-1-jason.pettit@oss.qualcomm.com>
 <e7bal26fyufjh2f4j6rh57bcdvubp3qqydk4pjagq3qjdz3ywz@wtfsiff726zx>
 <20260628162913.66306-1-jason.pettit@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260628162913.66306-1-jason.pettit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P0411SbGvEvY5_5CipQN3CoFIyqW16C7
X-Proofpoint-ORIG-GUID: P0411SbGvEvY5_5CipQN3CoFIyqW16C7
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a423f4d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=4GzbeD6DXjQ7u4-lyF4A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3OCBTYWx0ZWRfXwd5JG8ZVOkKc
 JhVoNRYp9jT9dVmXQP/IaDf8V5o6vt90Usw6jgWDv7TJF9j9iSDo8exsItIynhwpnDmrQaWC+rt
 oSc6loiL+/CHuYGamYW75yddk/EB3so=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3OCBTYWx0ZWRfX5wzgTKdn7GVP
 MyK6XugxBdZBCP1rYV/kqQgXU3Mfw+XelgLfEHA/yypcGWGdClMcHejL7s7+xqF4/ng1kTJXKfy
 rVUO3ZaFaipoX7pKsCnNysxKDubi4eZ5l37mWXGdkrBlC1ulHbg3ffkgKU7btIeGHyR+3kJUnub
 6SSUXi16+sU9QtbRPUlnSnLxLR9Wm2nEoLUFE1gT21GusSObOwZUiuWOFlrb/MHjgjw0byKuGsx
 eyhHrBTxrCYdLc1tvaleQcxU9iwGuCvTHMuA8eXPojRgXm6EyznFrMZ6c1FnW4i60HswhkzP7Wf
 ROgManaS4ZgAY5O3Wk7X6+8JSBo1u9SRv8T6rAbFqByFtGH/Am8i0uaQWqCI5v3hgE45qGDl4Wl
 j+QqagMhXmU0HAP3W0cgFSRZ2G9NgwoZuEFsFEigRDUo8RyqStTRh9+5yeXDWmQbUSrHwtBVRBJ
 IH4upZ+y5aSqGwemtDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290078

On 6/28/26 6:29 PM, Jason Pettit wrote:
> On Sun, 28 Jun 2026 16:02:24 +0300, Dmitry Baryshkov wrote:
>> This is very surprising. Can you check, is it actually the DWC3 or is it
>> some power supply that is being toggled by the USB controller? In the
>> former case it would mean that we miss some bits of PHY programming and
>> still depend on the USB host / USB part of the PHY.
> 
> I tried to check this. I am fairly new to this, so I mostly poked at it on
> the hardware. Here is what I did and what I saw, and you can probably read
> more into it than I can.
> 
> 1. First, with &usb_2 (the dwc3, HS-only) and &usb_2_hsphy enabled, HDMI
>    works. I looked at the power state on that boot to see if the dwc3 turns
>    on anything the DP side might also need. As far as I can tell they are
>    separate. The combo PHY, the dwc3, and the DP controller are each in a
>    different power domain, and the PHY's regulators show up under the PHY,
>    not the dwc3:
> 
>      gcc_usb_2_phy_gdsc    on
>          88e1000.phy                       active   (the combo PHY)
>      gcc_usb30_tert_gdsc   on
>          a000000.usb                       active   (the dwc3)
>      mmcx                  on
>          af64000.displayport-controller    active   (mdss_dp2)
> 
>      vreg_l2f_e0_0p94 -> 88e1000.phy-refgen
>      vreg_l3f_e0_0p91 -> 88e1000.phy-vdda-pll
>      vreg_l4h_e0_1p2  -> 88e1000.phy-vdda-phy
> 
>    So I did not find a rail or GDSC that the dwc3 owns and the PHY needs.
> 
> 2. Then I removed &usb_2 and &usb_2_hsphy, rebuilt, and rebooted. mdss_dp2
>    still binds:
> 
>      msm_dpu ae01000.display-controller: bound af64000.displayport-controller
> 
>    and HDMI-A-1 still reads connected, so the PHY seems powered and the AUX
>    side is working, but there is no picture on the monitor.

We had this odd symptom on the Yoga Slim 7x - but the USB controllers
were enabled.. although we had some issues with USB/UCSI itself..

Bjorn recently discovered that the eDP PHY support for Glymur was
incomplete. Maybe we have some holes in the combophy driver too..

At a glance, this seems to be different vs the reference data, could
you give it a spin?

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cdcfad2e86b1..cbb685299d73 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1675,7 +1675,7 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
        QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYS_CLK_CTRL, 0x02),
        QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x06),
        QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x07),
-       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x04),
+       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),
        QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
        QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x00),
        QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_SELECT, 0x30),

Konrad
