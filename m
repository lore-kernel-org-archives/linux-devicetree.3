Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223973;
	b=PISHLZZe4E0APxMGf7hCZKgrTGTCUXobE9gV6UKoaFiXI4AJ7+zfqiGGaso8y24xlbAP
	 zrD4LPXTC4zejy+ZXp8Kk2d38/uT/eWdGhtFnMhu7owU+Biwalvrlnz0Be0m88lYb0sjx
	 gjCab6nEAEnoExjgGE/vvszVzZa5nUOdtVb74+YfSdryMhUI7pP6tonHdWy3Pe2VOR2bP
	 MsuOgZRGqPtPM77umdnN948JuLrgdOI2Gr71B3AP9wlIkYKb5tIhlX1FI18aFc3zAGTkV
	 GJuHae/EqIIxvFDM0EqpWYACPm+bBD0kp8owo7NFT0qAwLZVtMrK1IDcvnd/aJ8JXiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/rANUhb4Xkx6JtKbuxAVHCjVLfvsKmA/04qLJNQgDVM=;
	b=pYiXOBpAJjCoqAulaocaemnAs2i4aYfaovUiak21+yE07l9DU9Pb3rYztgb2n84HA3iO
	 DCehins28jF05wXGsneNtmCmtxOKhKpPhTExkVZXgaSLAH6MIB8WLv4MNFWoTp430Izwc
	 67HUEgJAqxjfavY7Zm9p5Tpv+NeIoDfGL9fDsEp6iTVmveCKIfiEBmz17ACpoZvJSc3ZB
	 aa1VWt0GJj8A3da4cBPbKngSrip597aJiP1kfp6jgwX7hKPavHIUtlABI3Ru6Ng4aYgaH
	 P0srySjDvWiBck1ZbrwpAQwJbq4Ysr5hbkljvEwjGDBs8f8q2Ld81fbDmpK4E5U7aHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nGtEMaAU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QoVI5T+j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E7960A2629
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75E7960A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nGtEMaAU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QoVI5T+j
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPBEe1026641
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/rANUhb4Xkx
	6JtKbuxAVHCjVLfvsKmA/04qLJNQgDVM=; b=nGtEMaAUMnY8ZfsjlaZ2+w1jLt7
	L9Rx1iOw7xpmjdJiDoBju41uzaOx5ALU3siJwlPSCuyIc/BV7fUSjBDE58hEGYqQ
	d49m0JdYRqoEjx6QMroaCia2VPcjaXA5XxjpUTYTOhc0+a3GuJLddb+n0WhrTUxc
	qdV5BwU9Zpojo/mn8d82l9AedbW8G7iqdy6+uRoURISPJwZdQgXYtepy4NJeiSDA
	qFbuingji5YeNLrTVGgMhu9VI8Pv6jq21WpQAGEbXfCadbLLQAOG9/jLMS9z+loR
	8sewKtB9WXhjcX1aIofMer9wkjyYgArS/DG/AX9j2MGC5SyiPVFM653jkLg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb28y0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:46:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7bf2d734so26582926d6.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223972; x=1793828772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rANUhb4Xkx6JtKbuxAVHCjVLfvsKmA/04qLJNQgDVM=;
        b=QoVI5T+jRH+ZxQ1uTqZEQixINE2mYFZ8zqc+6qOmLHt8uvaDwGNWRu7pFYLv5/Z2kK
         flSivR4TkoqlVosdQl5xAwddMTBqst5BoOTjxT2MZDYV1xfQSv3KQ4wRgvOrKziEMkAP
         RcUGGmeJAdKTVlWeDtZEeOtST4YRKzADMFTgA1JiOG77swoJHfdlUsammjLCMOwoUc2M
         6+j2aNBdA6Z06ScOMRD7KVWbCRfAfAGvYEYzp/O7ByPohQ6HOXDIR+01sNaVajn4WzhM
         fT8pVwEGDmok2pTz0fIA6V+CW41mas7wsXwkbUYXVPvubZjNbVHXCXQ+UYSVenk/YcRu
         g/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223972; x=1793828772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rANUhb4Xkx6JtKbuxAVHCjVLfvsKmA/04qLJNQgDVM=;
        b=B6+qL8dmeXBuYHFVMAKakoauXECTn428ADnzAnSYrCHYDvvc7uBHbnSSlKrOI6id9+
         01RnuhFXXBL5qep/psLSFMhej46yd0/UpXCNK5Mw0miGbIOAfwaFGHjQvy5vm7N3niNe
         jjJGN+JJiHOZKHQtI8t1vVYTqHCSlpN792qXhyepK9+OOImd4pfM0C/DuprRcP1hkHa/
         cOKzOxbjPgFM+zjaseCL/uWqJvPjzWCXqH/dzv3a+vmbDDU6IdAS9MY14/PWdMFfZQQ+
         1R3ubTXW2bmRXNhkRSxVY///Hp8DVuPFCr2Oj1BiGADxYg5/w1KqOy8egYZYoRX4HtS/
         VbTA==
X-Forwarded-Encrypted: i=1; AKwUvBxR2druLp+P4ZB7KFcqCNjGDk8JR2TQjDYKDKJwG4tPECUuphz3rWuDA8et9B+kadl4yXFWG/SUPOVQ@vger.kernel.org
X-Gm-Message-State: AFq9FYI2OKzfx50CS6IL+o5F4ggn9WZGzzJvNj91zwiTaEQsJ54mY6R7
	M52xizpDAYGxe7ivh5Li9+YCz5EQ939RX6j2a360HDr8tJPf74O7d592DQyY+xumkkNWlNtW3IA
	v5/e5OpPZwSciIrmBcs1m7d/MOQBrjgjS4EwInDfOahKVTrnTczIuX6cGmED985GF
X-Gm-Gg: AYBFou0CgEGaFdZBd29KEZF/5NuEnEcWNeC8MpY2jrILt0Q4Q1L6F5BaXWvzeu9k1O4
	gwDTbxzGRzwUuFwep34vdgOiht1KJ7wGRqBuxI7bW8C6uDRX7alq4x3aR/NEVs+hsF2D1VBTV2S
	gycxj/20pV+M1WoUMnwzxnryZJGinu63b9l/lnbM81l9GB8gHj7QR7oMF5b7b5y9H30i98FsJNh
	M15neiIXGcSmSbapFhMcDtxbi80g0eh0M5s8wXbNViSZ59F13+leKL6S6yoZ8hXrGipVrHv2phJ
	8uxkrDy4p24mSXGbehhgioqxllD5kV+XS4j4IPbTTj/bd6c2d2s8Jbwwm4dKyciBlb7rOEdCsQD
	GJ+NmWZxnDaJlOlioIX8WVPfN8yh3CYxvVSSimE/2gSEaMqXEeqwwXwnAxAtsHQ==
X-Received: by 2002:a05:620a:40c2:b0:940:f224:5a57 with SMTP id af79cd13be357-94408ca17d2mr582262785a.62.1793223971633;
        Wed, 28 Oct 2026 14:46:11 -0700 (PDT)
X-Received: by 2002:a05:620a:40c2:b0:940:f224:5a57 with SMTP id af79cd13be357-94408ca17d2mr582259185a.62.1793223971096;
        Wed, 28 Oct 2026 14:46:11 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fead817sm18642395e9.12.2026.10.28.14.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:46:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: monaco-arduino-monza: Add label to sound node
Date: Wed, 28 Oct 2026 21:45:51 +0000
Message-ID: <20261028214551.108424-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae26d24 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=cphMBCBa6KgUlh22nVoA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: KxGeFljKdImj1hd9rtS0e7ITmU7LiDTr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfX0R2pCaIRHWOx
 Lee9/UMVpbEd9xO8bwGk+egtuqbIaBlzN8nMGc9VKYGSVkGFsOl958DOX118UMNEB5JHsNHspjJ
 Mvff/V+BHfVSMB/S/rPZ6/eBRJUphkc=
X-Proofpoint-GUID: KxGeFljKdImj1hd9rtS0e7ITmU7LiDTr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfX7r24o99XcW1J
 RW7OI/NrIM9hhWPh87+brmwFhQKOycsnA9wEg0ewQ7uSSUgls4bFHb0XWPubSJA+kkY9oTwqhwN
 kURLkfm65gMxynZqkuAf2sGfis8SVhhKdQD1XYr+/sydnrLxbjQI3mgSvFsFY3DmDIWkQ5v8rL0
 nHp+NqicRiy25FtxSNaHdJ4KQOp7a5jDiAdSPn5Rg0UAnF7SiiMdtieTNW5tISp4rTS87698iFA
 8yHEXHYfyOmsKtqI6bIvLVjVo9ktsFu5wAPtzVM+3J/NVRKne0KoNlvygwDt2dnxQotxY+QihEK
 hkJFaNQ4lzHSoq7idnrW/3cS8r+3NSdcGlviLhZ9KaZ9pe3iF5XG4yNmAR0VRurH5yOUnmXZwtD
 y0Kq6ZqFZvaeojS9blF4Tz2hkjXddg2LAzCV7zawXRJ3wJ3VxrFdxdfEwmt8QTQcvYgpj44wyOC
 AxVsycCu83gPEyFPSsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280086

Add a label to the sound node to allow DT overlays to reference and
extend it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 2fa652f3ae58..9ac2a04b302d 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -63,7 +63,7 @@ hdmi_connector_in: endpoint {
 		};
 	};
 
-	sound {
+	sound: sound {
 		compatible = "qcom,qcs8275-sndcard";
 		model = "arduino-monza";
 		audio-routing = "IN12",  "Headset Mic12",
-- 
2.53.0

