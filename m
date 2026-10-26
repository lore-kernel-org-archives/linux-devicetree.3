Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015118;
	b=lFTlOIG4Jn5dors1Af5/+gXnere4vpagPeU1NBXNXXIq7kCAq3KaAKaCAZj5gI5NSrHT
	 d0XmPZTn5SdOvLGJpfLkAkLJ1dmx0FR4+9kZ9usjNCADesIfBNUI53e8IwrTNG356wNyu
	 wtKi4Eqn5gjOhGnbCSs1G3wEB31LSbl2dsWHguGM0gGlKja3u7jZap/H7hnZpX9dWaK65
	 R8xeIIE/URJFPTvSvDrzbvhXR+8k18KHysgBwW9LeQuXQPReqX33KAeadCj2/cFMo6md2
	 gQ9UWWPGlRCb2jSrtZ8pShFvZPmGd7xykrXjG04dRorFOJAdDmSaeey0bpLjsBZzg7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015118;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nau56Bwlcvp87BKhvIgVtDmkGKpud4DF/A6PTwprpXQ=;
	b=BJk5XYCemqX73Y2RQT5F+LasCvbDCaAHlnthsXRw9mbK5ftSsk8pGAVMiSaOow/yBpGb
	 WGYSyA0Bkw6wLtntaR2NZUhNV2BwnRIEahkmV2i5K+vDF3NCmdUt2rhd3OR0njFqaxzQ0
	 KTjwF67p3JIS0yegMTn7rvM88g0Z5M8mXgmp9+Ej+SkWrhzqoy83EDpGkTK5wK9GbK+8H
	 A/EKC2drqc310LlFOkTRUwhfaDAd54wLkL0sJ0uShdHepE1fOvZOcvlYlbs1h4LgOJ2j6
	 nfHCvMltr8/U2hSuFZpVNBSWmM3sDHRuRAROjGuFIC3+BePpONKw4AT/LQwCOGOj3Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJzksRHG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8QmASv8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCE360A2600
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BCE360A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJzksRHG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8QmASv8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAspKe4131387
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nau56Bwlcvp87BKhvIgVtDmkGKpud4DF/A6PTwprpXQ=; b=UJzksRHGl6NY9G+v
	URmNM5BrAMaivYBmNHNrUGNHDJr/Zhpo/nI8pnS5X/Ba1sdTWQZftUmB31MtL/lN
	49BVZ+M5UyAYYKjf48WbO0nouWJQYVaNU5hBTYEMhnbM9z/Ed9DcjwwLSsa4hXmS
	09/NNFVhO7JPiAkZW2V08V3FBYXhKYu5TWwmtSJbJByZ+kioieJOYo+IUUxJZI0G
	e6CX9v9GBiMHP/PMr71bSrQqNNg55T1DyZwTMwHyMrUtGKFMBbc6boiXfW0hhb8O
	N1uua5V4ukWvaJI1JtAMGGCtXFEcLY9sdzPP9RGAEsQgqfbg09Q+OdRfOi+rsDOw
	4ap89g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q08vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:45:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso4450733a91.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015117; x=1793619917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nau56Bwlcvp87BKhvIgVtDmkGKpud4DF/A6PTwprpXQ=;
        b=W8QmASv8/nIat6830N356sKMRo/dvufMJnSffYuBFHSaprmHLDifgYb7AfHF6cmlEJ
         cJq7lhtsc7YDna16dnXBJg+J4dEHLyn4k6V53f+e6JX2RsD/Mr9oIPXplw2w/A+ITPTY
         B8xUSYMVloA8Rt8ZOXPkQxj90SkyBxwY5GwNY5/MSoXt1zH+NACtJJhKqmW7w4TP8U6f
         uw8lzMiMFrvyisDonXtHy5MwB/T9+sM5K5/uk4UOoAUgoqh2NmwV5dvVoyCI0ZH1LUJD
         5T3foB0lR6N9imqPXR9cH16MsEmGU8+dmiTmuQybsRVbOfU3AI6YyH21w1wZSgM+9p6A
         XUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015117; x=1793619917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nau56Bwlcvp87BKhvIgVtDmkGKpud4DF/A6PTwprpXQ=;
        b=cSbh8GF0/tT+ERS/um389CG1Xik8ekJpb6hN7LYIO3UcO4jKZRQowhQR1QaH0GZBF5
         nvqJlxASDkHEbFn2+xmADO4ZuwPESjTZbVIHDPOaMbytAaJSnMgPgkBllX6ApxSISb/Q
         CPNgwVegRE1pzfgdrLxe2lDUnAigCgYEQ/bQa2z27GL2WeXVFY/S1Z16UjuJ0FmSbYRt
         h5Y9T8cRIlp2pBLUypDKYYt4N9wSj+lMbNRBZPVDhMMHPxw/indQ4Wj99wcwfW+8Z5n+
         pTXZAMJGhwEyFjPoiv2CNtFrU7JNZU/4gsmDNrJh5Ba3OQ9OwBgww6NobLc5QsjstjU5
         +pAA==
X-Forwarded-Encrypted: i=1; AKwUvBzRs/ywdrAaDYb5WZgA2R6sPj3fN+j3ncsgFYaa6Q7VHOMg8g9K2noYfIjwEuHjnFywhDjzEMnaB46v@vger.kernel.org
X-Gm-Message-State: AFq9FYKWaTc3P4KcaMDUr4v3j/c0+tzf5+Q7n1JicurdEujUS+shjpxV
	5bXTr4KI3NCaJafgM4+SKg+JbRepU1x7h4BhpJWirGwsu1pP+fXjokn0OJ6o50gN33RvF90QCe0
	nobcaEALGYP7+TROSLP1qyUXitJjqnNxiy86VQtpRNAS67mM+2c7pNR2WewnMZPmi
X-Gm-Gg: AYBFou3upiHW6+Wh5jNuwOLNHHzvNp7EEWu/wWtwSVyMHTWu85MnffrjxtNJSCmeBN5
	xIVjrr8OHHMeLs8PBgNWKHV+rSPhZ+mDN5oV1N4y2koS6IoYS9f9RV7OI6lALzEt6kzKodgWvAy
	tRNgGF2tpRp75yn3OsDNWhYkrkf19w2tvCm7d8Pi/uDxdMoI2nRinLk+vJIOo81+3clpIYGXXYR
	IjK1b0t8h0bOjNYCS+PWH2yHORJS4cpJr2VoiWOaoxMzav/KsAE3EY7bsrZFPXIIoMSMvJjDYv6
	LztFnuetvW75sauvGqiDfwAUfRrkIb8jNM/8pbI5LyEbdCk5/i3YGGNiHXc/jw/8n8CD/A1Rf2M
	0SrdkMxHpd894/nSw2evaRUuODeQ3RnGdqqc=
X-Received: by 2002:a17:90b:52:b0:3ac:c23f:cf51 with SMTP id 98e67ed59e1d1-3adeae77a59mr5872036a91.49.1793015116647;
        Mon, 26 Oct 2026 04:45:16 -0700 (PDT)
X-Received: by 2002:a17:90b:52:b0:3ac:c23f:cf51 with SMTP id 98e67ed59e1d1-3adeae77a59mr5872010a91.49.1793015116248;
        Mon, 26 Oct 2026 04:45:16 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:45:15 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:14:35 +0530
Subject: [PATCH v4 v4 7/7] arm64: defconfig: Enable Qualcomm PM4125 and
 WSA885X drivers
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-shikra_audio_dts-v4-v4-7-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=1168;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=nqBPRLNLSFYAEVxGi8/hLOLK/FfEgToPKt2RuBr7j1Y=;
 b=JtWPV30Kq7PmGOnW271CMvvGjpyCitOMLbtO9aPeEI8GOgYHypOnVKpsXNtDV7INB1Ne3el0w
 oQf86+0WcpMDKxWv4DvZms3H6/qgwaF0tTrbiP4zo4Cm0B92V1zt2r2
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfXxrBxXHvrie3H
 AVhcm7M1wZMq17qsM0AR/sVZqkk14Tj/2uS8X1b2p0P7Kv/ngtRnMssGam6lNRbw/u0pUc3EH54
 A5pkRdyRbmiSyzwvRFMzdaAVceU3M3c=
X-Proofpoint-ORIG-GUID: LOde7F2NdyuLwJ8PsZ7PqqZKUQUJOvpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX1s/t92NgFWXF
 448wB8NAb0GSNP9cQN0Q9dzdZRur0InQAbpO64jkMmd+rUR1qJU2B392SktH9TVtrjQ0JvoPfJh
 T7JbxyiwAUoK6HENxnONDS0gey/u2F7BLZg3kwnRNbJPirWddM0zitR0kHhr6wrSSeQJNcFIGBS
 s0dwUjzjXtelTs+Lwy/oDS6narP6qn/pAX98qIxoib93nHrNGBdQBA5ptvFB5Yg0o75R2CcC+dT
 v2lLnhWZpFo9SfhK9C6lzo4ZnkmVaC6Ab21/WQcd+f4AaHi5K2DlmzqM67wlipLjNEbAtDrHWtD
 RGl5fNni8o6WYNN4PKD4mZ9ZHgPbQSgwU/woiqKa3G9BFAFtXhgwES6StLKqTGyxz5y63awbREP
 bziVc651j4y6CIhbgw1N7KN7hAS06FTf/liXjRe2PuN5M7X3Cb341G1lrm3Uh4tLiIoxdADjB6D
 cKYt0mcbU00DkJgWlyw==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf3d4d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: LOde7F2NdyuLwJ8PsZ7PqqZKUQUJOvpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260046

Qualcomm Shikra CQM and CQS EVK boards use the PM4125 audio codec for
headphone playback and capture, and the WSA8855 amplifier for speaker
playback. Enable both drivers as modules in arm64_defconfig so that
audio functionality is available on these boards with the default arm64
configuration.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..bfc3ec713ecd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1175,6 +1175,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
@@ -1197,6 +1198,7 @@ CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SOC_WSA883X=m
 CONFIG_SND_SOC_WSA884X=m
+CONFIG_SND_SOC_WSA885X=m
 CONFIG_SND_SOC_NAU8822=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m

-- 
2.34.1

