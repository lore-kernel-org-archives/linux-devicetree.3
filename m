Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782220;
	b=XX8ZKaJ9IleMPC9O70NxAWyUvdEEcBiaDQtEWY2dfjAjshTN6R+C8BE4G7AwkSxKFp/w
	 fqiSfCJy+uNoty+G1jAt/EO4UDGfUnvyJeNTkJ+mGc4mKACDrMbtP8ku0nDgVDzi9RZ7Z
	 tA0Zdf8f/dfaVeAPEL706mdRCB9O1iPBFg37Ent6XbA8pEGwLuOjebVr1/dT+eEgA8A7+
	 Dsnj4V0/fp1LW1oJz5yd09ZSwXTLtLh/t6LQZJ7dUm21fFBiZ+J1z0vUOzg5kTwyS5iYP
	 6V4+orND205l28MzkC/OUFzrbndECkWJyXATPZUw+Fe5fD3Qu1dIhFM1DFWX971Xmrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782220;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lK8pPUXcb7bisjMC4DxnwGbKPhOUZYiLD2d9/0wlTRo=;
	b=ckN1pcYpzhHs6B98mRbsOg8K4w55igjp3Gi5dVsiNtQ77G65CHG/QzTYPYv8t/bwSC44
	 9Yc9umaPkWcXDfQ2sqaNbnvA+D0HYskmlQmN8V4svxlN1luD2es20cVN1OdmJMAuhy1eE
	 ormlqt5BXrvzTIzJ3iaFw5bBakxB4l717Zxt5KdB8/4ztMSiEtMRB2HcVaJy1r4fTN0jZ
	 JSBMxo/a68r8TWV2LPTyHiu3/g3EbjrjxBjVipxHeQInS9y/6XuoQVqSMLZ1RWq1nKx13
	 usxSFNpBffgW7IBpAEgKCrztquMbYDwmNVmlSOfkE0owLg25Zx0dnzvauoTFBetT5cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SjnGRDle;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eo48tSPj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D795606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D795606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SjnGRDle;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eo48tSPj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApFwd1377053
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lK8pPUXcb7bisjMC4DxnwGbKPhOUZYiLD2d9/0wlTRo=; b=SjnGRDleNAAcuVA4
	WgJ/L24VWNvzA+EPkz/+EtsLBy86MC/p1E50Zy2OV2Sd3koUuECdD+jpPX/LYu9f
	s5XwUYs+M3x3LjBWpPhjGE45qxEZNxSZ9DLalZVafxIpDvGafre8sbgiD5NOhHuL
	mN1JDih1Au4KRZbm8FLAoUOwxxYw5UC28KZCrRa4FPw1qJUIzdDu82ul3H0lZeHt
	ZehpD5wVux3x3/7w/UR8ypTpZvKz7HbqRF/A3fZ6o0updRvhPnvFDGGUXzSPTVcq
	jtJT0vy+XXS7IlCPJar4vrrFDN64dwTO0LJLX2XVTCJfc0RTS/uvTLsm/kol68ac
	fOGhxQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3ag60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:23:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so417979e0c.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782219; x=1796387019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lK8pPUXcb7bisjMC4DxnwGbKPhOUZYiLD2d9/0wlTRo=;
        b=Eo48tSPjkh1F0Jqad+al6/t4KCppw9VvqxSaSDB/2VgNpNdboM4GmMWVTP8m+fjLF/
         M0iW7eB3gBtgqoj6YgPYaHLE1DaYZ0hpSsNaf/GrLri1IxODTzLVRBOoY2inra5P6gv4
         4AHbfWH2/0qPUNemZMIlIy++Qhk5oA4xhNu9725CvNQyeXJ1Azzmo670WIalR9W6J384
         f5ywlRJR86LRGIrFVyUUekMYExUlh+CZ/GV+pxVQw/MvgPtAqK25Qfj+iIVK9CwC3Njn
         RvPo1zhBIV0TQHUCDQXbXsYIWg4rDCVHa+8irm8/A62JWWKRY+1R9WMJbr/XB5mrNbtw
         2vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782219; x=1796387019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lK8pPUXcb7bisjMC4DxnwGbKPhOUZYiLD2d9/0wlTRo=;
        b=d0T+h0t0z7jsGIDujiEhlJvxj7prD2JqU4CIdPCQvkUInMQyVIN4XVsmrvQwGD0oHu
         R6HUMRiG8XkFNvO3wI4xw5jdP1g0+APzu6PntAYT3AkV3AkaiWaEKyhpzhWMBwQ54hHF
         iKa/zP7Kaio9IezpiR8Fr9OVV/bgDMbYF7jLV1PAvGWYKjxW7bwcuQOXxxwsyaNaQQNR
         JcmR+XYEa+tKAfTd5AV80EDcXLV3NGgUUxZTvGbQr83W2O3u0KgQAHOFYTjTfrXlV72J
         3oaWasoLtUNv32Fci+2/EeUPJjgf3NVRAHz1S+91OrwK1un7Ups7w3b21IfTeFe0Txze
         S/cw==
X-Forwarded-Encrypted: i=1; AL+hErHIbYI3RTSye71QqQXB7q7pzOKEy2Mg85oGWpPYm0nX8MkJy/VvukV/Z7pG77A4ELd/ig2/f1YE8kQ6@vger.kernel.org
X-Gm-Message-State: APuU4Z/mYRqB9x/+gE2odY+9Tl4MsJpR4n4gBhfop+Bmwg/A+bSj848K
	t7pX0oZ3TSsx8w8J0hYRx4CToga0Wi+sl5HcZLJ3s8ap9H3G4RvIC+h8Y2vulJ5p1awNAv+iK5y
	7k9AmOSINx6yVT+BBZ2bKUZ8mzLq/iP4CnP54vaInPgTNMcZlxLtFTE5G8mgGq3+W
X-Gm-Gg: AZFdTZc1xUXvVHKN44UL7dl9GZgaAsTFkQSh7lcoHIrWe+MxpfjOXFJRxAj0JiEWJOW
	ZtFWCsA7kvqSPnURfIgVo6a4r2YZX7dhI+5/tXNkSn5gGiEDC982sncjr1jWGvI8gUZ95QwHGHL
	2e4yQXuKZqevF92GOcYJVOX+dkPzgKen8EX8E8IFjnfW89Dxep1OtRBoD05nJfC1Qe24Eta2TwC
	FTTDIkN2qq/BIZUD+xU8xKFrTXw5N05XR4GHho+YCE4UUFoK+FvbKV+WRrJyKeC4jK+5eXXqj5z
	f3snDjJ1LzSNkNd2o3BIa+hW8AhTcYyWERAMQu/5RPwhqaPEdZ8uvQe05vCHwT+BHyLmqIgyHm1
	quKshagnW70XzvtPOb9H7+3F/qpt6a9hnbhP5vwoUg1sKi330iippUijM+uuQ1Sq7oqr+gaU=
X-Received: by 2002:ac5:cc70:0:b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ee8af22cf6mr15444461e0c.4.1795782218605;
        Fri, 27 Nov 2026 04:23:38 -0800 (PST)
X-Received: by 2002:ac5:cc70:0:b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ee8af22cf6mr15444445e0c.4.1795782218186;
        Fri, 27 Nov 2026 04:23:38 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b030ed9sm874678466b.86.2026.11.27.04.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:23:37 -0800 (PST)
Message-ID: <37815f09-c791-4110-8c4d-cda44bf86b2c@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:23:35 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza-mtp: Add WCD9390 USB-SS mux
 for DP alt mode
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261112-eliza-wcd-mux-fix-v2-1-ce7eedf47bb3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-eliza-wcd-mux-fix-v2-1-ce7eedf47bb3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b09764b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vlQx1epL_Riolm4RhqoA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: cmQBSl5ID6BdhKcue57lxfiShHMSMe7U
X-Proofpoint-ORIG-GUID: cmQBSl5ID6BdhKcue57lxfiShHMSMe7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX1RpINXMe2GkF
 RgmBBvy+WMo3tTNWJ22jKW7x3z7X1+eNYZxv+1jde6mXEINw93c/jfWrhUm/aDEhpF3YPUTw1x/
 B5rZF7BeUfurz7wvyYI/ehi/F8fFUXknLS6CcWomVMWt2++24fs5eBUPZvZQgiw3cZu3LvSBojV
 asEhjrmm/3Yx2HUk1I8LLmJKERlrPO992b7XW/KQDyUr/IzjvWv9xu57E7haiEu2jH0D870AcsB
 MyzQ01OMBH+a6901s20e/0oQVUuwh9b8SwreSXYfsfaIKpKObjMwQzP08WiU7zGVwc0PuNmSFbd
 n3jVo8eXVtRCgXtMXRcA5X/zkd2lK+XysEDE67vtnJtCUyOGSMFKHFn3NRk4JOY8YCD/QyFyUSm
 RhIYgmbA/AcaZE8H4xbmwLwqaAwdOujCyma+W9jTxzi2UP2Gg5QopZBZStiRfxooAoDNwOjmE7d
 bh81hDVeFkLtenBQcww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX0vFyMD1b6Whm
 WFnf2K1QXWlpJFA17vfF8WRshxpr20Mc3Y2+zX4FgZcND182JgGPxK5khvKgNRQZ1JtRlJ0CUur
 IkjWrYgskXD5Ns/3I/ViXrZhNw82z6M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049

On 11/12/26 11:18 AM, Balaji Kalkonda wrote:
> The WCD9390 USB-SS mux routes the AUX/SBU lines between the USB-C
> connector and the DP PHY, but eliza-mtp lacks the devicetree node for
> it. Without a physical path for AUX, every DPCD probe times out and
> the display never comes up:
> 
>   msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
>   msm_dpu ae01000.display-controller: [drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, status=2
>   [drm:msm_dp_bridge_detect [msm]] failed to read caps
>   [drm:msm_dp_bridge_detect [msm]] aux not connected
> 
> Add the wcd_usbss typec-mux node on i2c3, along with its supply and
> reset line, and wire its SBU endpoint to a new port on the pmic-glink
> connector. This gives the AUX/SBU signals a physical path from the
> USB-C connector through the mux to the DP PHY.
> 
> Fixes: 193fd5f1aadf ("arm64: dts: qcom: eliza-mtp: Enable DisplayPort on USB")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
