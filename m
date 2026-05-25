Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B44137DACE
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779709676; cv=none; b=CmYG3dYbmGxRC2R/A4aWij6q9lGeTRy9sHdBC9xs0GOJezzse12mMY7Mt8h9qBntDFe+dwN3a7eokgLvpVGdwg1crfS+OK9PAdpmOwtmTlUNpTHFMX2Lpy3sKpPOvlNgYShIQ8N1WhEuPUB4v69r9uupIs4Gr0h1Fl4DiXgb7y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779709676; c=relaxed/simple;
	bh=KoxzW3fw4FEsw0k1Ufu2KlWqiqmhbI91UrP7hG6eJ7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdN5nr/y5Oi1HWc7PICZPg0bSRDYgLOMrYVI6250KsaDjQ4H1HyF/CIUBw1AdiXpy6aQYdOQd7GyaoIVzGh1Y+M93CdS0Kt9iOp2zIdC8CPxPJiGUPreCLGmUvVgRJOWXyvNMl3LjU+1NKaYcJGd1bRffDbpLAFaXEfvscbzRWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gq2W82Sa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akhe6P2j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gq2W82Sa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akhe6P2j"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PApm6H3282561
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NaE0DGEkfp0
	MUs7qkm7dUKGJKosCY/lQ9TvMSsJpoP0=; b=gq2W82SaqMA44xnryZixRGmpmAy
	1VtJFfhz5eiRBl5BBH/ZNNJz6Ei5aCvgZHsAct5a1dkOwxIS+dfuOvutGoJsSqRb
	TJ55zx7vs0id3lLGSERMoJaV1TvCfA3I7G5pZHDd+b9yas+Mjy326rHjrpQ0XMzk
	NJudlA0rj6ZORXqopS5tekEvPcfJ1aOWRU3YdbC5bB1WUe6Mlcf9+hkm6ShqDN0b
	0C/Obw0L8QEHCIzMO7gaiMWcRpzppTE7Ddnq5okhM1fNEYlyReqouNgswTs33tAC
	3/Prghb3526Gzrq7+r1/5QzGUjIAGKg19DT6kaD4STf1+qQEZnWlPS5/xCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3eeu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:47:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d13328dcso72423601cf.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 04:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779709673; x=1780314473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaE0DGEkfp0MUs7qkm7dUKGJKosCY/lQ9TvMSsJpoP0=;
        b=akhe6P2jX56aaIBbjMRoful4d8bafUgpPC9+TPw2CAmlTVtmdHJG1WTSfQ2fEkH2wj
         d9Z76T0SQrfaQU2cwTlEperPZStqHQ8xwuWRoeDIQ9prO4eHFIRrEg+haZxOh0qcRBsz
         5J0jBIdLdzDgQHPkWWPYPQNiZVPKpOLIlJ6CrNgptiNooozXC3sagSMAFZyI/dNf1n1B
         f3dX35V1yBTrRAPvGy8+z1+zo3BgsXW2YG4nIFqwK5aP9XbvIx9RUhZvHsQaNw/Mi+QN
         odu2LyiEgpsWjYdkeMfZiV7FtK4OFIniMQlN8xvPsAjEk5CB0eWqaTK063ITa5VbPSaR
         Ukvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779709673; x=1780314473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NaE0DGEkfp0MUs7qkm7dUKGJKosCY/lQ9TvMSsJpoP0=;
        b=Q6lOI4kuPSyu8+TGv+iCEMNEm/81NrGERHqXiLN39UgK40ktiApB3r1KtbJFV69v+f
         2lafaY/+ZI6J6BW//oeuVI3/JVHlr3pAT9eP5Qnq0AXKZaxG6T0EcNQyNgy7mzn8VLWR
         7zPBm2HmZlXkQX5HCPO+5p2psrq0rdStP0NHCf7zfjScybGSXfnUalbYfKV//6gqWDJ9
         np+nsMBPyW3QrfhmGbTgA9O9k/5At3KHzfv9+z0ieyGuBtxs8H1t7lkuQElxQ9Amiquz
         B5C+HxEkeYFG5Sy4MgcnQ1J1oqV71QgXXxIsxueHuv5zzRhRsrNa6aFT2jqNKFHU1Ugy
         XG9g==
X-Forwarded-Encrypted: i=1; AFNElJ+HvlclpMmk/KOnOQOtatH9YsWsfpvQMGqQ1et/ZNunGT+sE8dxgk9rCNnKuaEDFN+X9Q/LZQZSlCyo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4lomxq3DfUrD8gkhq7ormZP9JFcmHq68ODQGBL35nShOu4AYx
	2PCiVwSnc4QehExi8h0sDNmGqxn9SybxuHQd9XUQNg9xEpc1dVxDYG6hElOk1/vcjF2phU88Vwn
	fxjlkK/fHJ0Yb3ZjHgh4Qy1b1yx5hjAcaU1frYYOJ/Qmf29Hq7GYoTSa3SOF4l1hb
X-Gm-Gg: Acq92OGLouQvKuWWIQOndPB6yVHqX6J2nIfJH7CybU15yNYcIKOvbbS0g+3APBZGU2y
	VGxc+raOvjAX2EzXdohfoyM/smzwHewW/NPUaDnjs30QRo2JG09sZ7R0F7YP4Ie/wtLPfA7Q61a
	06XkLJVpwJy63QJy9y49cIWbCOy6aQNSFEDLIj/g/q3bjVBLsAgvFynP49B6WQJOwV6ioTJUB50
	mv8PPCb6+jGgLIKqvikF1LXyhmw7MdkRmxSMxzHoQjy1UIYZpAqHxuSZBb4WoUCwEu2qfbK3CEI
	pKdVEWMVkprfeEa2/JypNTmvacWIErViXuJYR9YgKUXV1vtP5nf+rYpQbd4U0iarvEV5OyXcMiy
	AB+lt6bImrQH4jfLcbnpo1iiuKupm2QSi8YqlNFjpv8iHezcyfs3AU92fHpUJtepmQuMBYgNaxV
	OjiN9Hg4+QIKc70PZWNr9m8MFvghuJiTaE
X-Received: by 2002:a05:622a:180d:b0:50e:5aed:caf3 with SMTP id d75a77b69052e-516d443c70cmr199563491cf.9.1779709673393;
        Mon, 25 May 2026 04:47:53 -0700 (PDT)
X-Received: by 2002:a05:622a:180d:b0:50e:5aed:caf3 with SMTP id d75a77b69052e-516d443c70cmr199563231cf.9.1779709672897;
        Mon, 25 May 2026 04:47:52 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc66dd3efsm384096666b.58.2026.05.25.04.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:47:51 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
Date: Mon, 25 May 2026 13:47:48 +0200
Message-ID: <20260525114749.5939-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: j1uD4zz1pHols-G2AkuuNgb6FmFG5zK9
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a1436ea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Xh_B6YT5a0T53am7tikA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEyMiBTYWx0ZWRfX7FSe84MxKVHk
 pRe3iy93gW1jdnFmoUSIVzLBxjhN2PFCfr76zFgRtZjmXrMGucPl3sRk/277CyPXywFHZN+j8+E
 7AbaBEeoEXe1bZ3VAg0Ym2Qn4iFYNyJIYP4VHbb/+rncT05qKq6jNBwuTsK4yGHQLzGP7Cnm0ZY
 /DhX+vU9gqJPPA5RtMWGzXRIYL1qkJeaqqroZOhRaht1e/UFchlXNcrJw1srcdlkQdZhpAd1JdQ
 sCQ2i2Y1r0OA4BxHDNqPMuewCQ8lfhgfHHfHpufGN8kQgPiULNBeHi4WNyH3623Ws2DaPKPp8mU
 oQbyTFdKz738e/BpAo3P7f+z1EZsvjEu51Qo5Metw1GcCnksgCFrQX0coYWYAzF0goBaoBd7DUK
 Vji/jlIeSCx99GcP1Q7hq9BHx1mFx3wQcgvW5sSg2PrGqeQXrlYb7uS5TKrGeUqujCoU6oB+1/w
 QGUlHskrpu3ZisWg/bQ==
X-Proofpoint-GUID: j1uD4zz1pHols-G2AkuuNgb6FmFG5zK9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250122

The EFI memtable (shown when booting with efi=debug) shows that the
xbl_tmp_buffer_mem region size is 0x1c0000 bytes large not 0xc00000 bytes:

efi:   0x000082800000-0x0000829bffff [Reserved    |
efi:   0x0000829c0000-0x000083efffff [Conventional|

This fix aligns the size with the EFI reported size and makes /proc/iomem
correctly show mem blocks matching the EFI memmap:

82800000-829bffff : reserved
829c0000-83efffff : System RAM

Instead of:

82800000-833fffff : reserved
83400000-83efffff : System RAM

before this change

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index de0f2346cb38..5a2e84365901 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -582,7 +582,7 @@ tz_stat_mem: tz-stat@82700000 {
 		};
 
 		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
-			reg = <0x0 0x82800000 0x0 0xc00000>;
+			reg = <0x0 0x82800000 0x0 0x1c0000>;
 			no-map;
 		};
 
-- 
2.54.0

