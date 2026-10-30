Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353157;
	b=Dx+JctPRK54JY0AnogA4+2T5h92SvL4woGFYhga1J2ni+ebjuWkQChORsA1BmqQSf4fl
	 km5pBet9Ias3hDnKT9ewyLhOBet6xSAx7xRLPC7YnTzqnmYGA8PJ0mqxsxw5bng3VLnnW
	 zecz7rLsQdefJ1b1b8yaeqYmz9InZaTf0eu5KEQm8FCW6GAAohgM6xKWSJd5kpxMkQXun
	 vkKG1Z1HFzSNdCpNo+AQW6Ssl6QffvbgaICm2xBhprBKLGRNYbvRNH9DKJKqSfNDFvMVX
	 NEdkyH/KkgJlp0ULL1bDXDeX6jZyI9yF/fthNLN1hiuyohxhn/LbiDHjyh9RqNtD89w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353157;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wat7q1UYgkEGaTTWcudFAFVB2otd83omGVIbYCT/JIc=;
	b=RXJdcW/KGjJADF/wYE2EGF665wtpfpzgPdoQf9W7g1fgnC0/ia8ximV2GiWx+ltvcSla
	 +cEFOAmp2hFkdU3ag9Lbcgl45Qzd6uZfnrTITGeBsZRUDrna1qm9fnXxL9eDM9c8YqNex
	 4Du00aNvJwOiw+0LoFSDoPdCXaPsE76nfgXZhcd54H6YimFoaDJJMasSW3L28JMOs+07k
	 RpaGfg6cKwmoFs4Xea7jE1ejASuP/UKHuISdL0ut1Jy4vS++lJM7C6RTZx6smlTAGxGDG
	 wT7f9UMtZ7TPAxKR7+YGrMqKOv37mMKh84EGA161/aQTtO4tZE/MKTYT73rXZGEmYoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fKM6Hf+O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmW2QZu+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94EC606A320
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A94EC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fKM6Hf+O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmW2QZu+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FIDM2733198
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wat7q1UYgkEGaTTWcudFAF
	VB2otd83omGVIbYCT/JIc=; b=fKM6Hf+O6j/LL7fINVr8cE27HKhBmPwBZkM6MN
	bAPoK/O5oGkwoWwmMNRSZJpfk0wlCptMMIkTooPDqcaO6iFqTMXfel4KZAdjBuHA
	qqeR2voCdJN4i1zIJ28QdCI8m6k1/4Dach9cl9Y9BayIJtCgK2u6MHZQIQgwjstj
	0yfKIxaVpGZEhZB0FvvKxx//yUU93H1yRU5OZ3+RJA3kB4lLG2P4qZq4inq2+wFv
	9Q3XoLP3Jim0cnTqG22whZl+EB7KnjDsWa6taPjFExPkL4POFwUL4bhqhPQ39UEx
	dSzazljrBUxwCrSMFx+/eM26NFTCsbsCM8DzaXtEf1fj01dA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj8ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:39:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so89571885a.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353155; x=1793957955; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wat7q1UYgkEGaTTWcudFAFVB2otd83omGVIbYCT/JIc=;
        b=UmW2QZu+Tyl6X1wK5EhC0O4uWFl8CE32UoGXlszMEkMhIln7MDKviUtx3g8QamJlrG
         qSC81a7dSEWNgCuOA2LYtjzMHcyJPhejo/6XZ3ug96Lubj+hIU5ghlQMNa3ea7aT8tby
         j0Fn1picg+ZXmm5ZWXCfA6jic6mVXBdFR2X+EPFKXuPdZetDPAdTcKdMMOWgY0qMf6o+
         85PB/m2peI7WwGum7jVHWqIUKYMFzh9ubvKFqJ0A9l73bPkA6uqhy6naxGFYp3cTqzUk
         68HPiZJkcn0mLCqNA0oJWWKrfJDY+UGSn9flmFKkz4SiOZ+4pJRnrQtSQ/LrCjQ1sYYU
         Vhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353155; x=1793957955;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wat7q1UYgkEGaTTWcudFAFVB2otd83omGVIbYCT/JIc=;
        b=F5kpWXKaE4baMPNRufNuhfb6HAME0LLO9EpS//+WeDY+cFZKllwmX8TGUMlXhviph7
         Zf3yFte8ww3AXJ9xQmESmOpFFt6vbBCEG0pUZK1TzZpaqf/Eml32dbPS/Kb9VBLfnL5h
         GjUPKCElaY3xCdekZJy8dQwD6/pTMUDXTvRFygbiRUNMpCYwoT1fcH263TvG0jQIBbuh
         57UwrDKDHfam/x3igXRG4JlnbXy0htyqI5nb1Yr3s5QBuIIrG6MDv804blppHaeIYmiD
         R+oEexq20huPACEIEaW8id8jJzcO2su9QizBQZ33j1UVsbHgtd/yvqK2vSDyiYB+rl7R
         70lA==
X-Forwarded-Encrypted: i=1; AKwUvBwNjLbk6yEVVsIL3vLAeype6M05QMSOpfjbiuNeq7gfcOtY6e8fXmSioozMHh9GLEVig4qweKiuj15p@vger.kernel.org
X-Gm-Message-State: AFq9FYKc2SA+ekFOgOzcY4abpDjI/tZ/lyxNDZNRtNtknpXYFRhy0T5j
	ZgaY6VG9FCaIVWWG1JP07a+HwsAFyPpv3gop7+tk2Ff9JNHmCjN8qP/SclJQokHA3WcTnrMZfjr
	gOaEluhRmA6H0WoInVUtlOIjs6Gas5ysd3xxKmyB4TcbLfzspEW61IzpTR7Lxr3oa
X-Gm-Gg: AYBFou3zAJmJjB3qdGxmwzurQur+FEZArznD0EKH7/2DMOTPz6ZXUvohrDNxIfloSgR
	akyA9JZMka5R4XqB3L56xBgMwa1iS46Sq28UZTrLDQgLCKvN3jQgZsdQIY9YoojZ3w5+2Bxkloq
	nhgS04aZluJ0bcs8n5QyEhMDLGVpgDu8c7ZY8rNFxY7X6p6HB1ZAGUSPk/mjD1nva21twmKS32j
	2VyriqwhEYD0V/jTE1CYkzZ6Si3FQ1ZURNgnlJ+DM/LLhTndpLR9MGa9J8daHCwpm2pu0K/wWwH
	QAcUQRjOHKirbig5zSlhJzBu0agHlP9yx8cBPClQtywOfMuChd46Ttjmk8f/QcxuUZeKzg6Fo3n
	psqfO+GC/eEAAGpTaHGG4nPevF0InkT0Lf39+fpdY5asmWSgHJV6Nh3W8RorKgcgzPI4i98oWqj
	6RuOLfpRK5I2sVqNLsCdp8HpxxwRIv7YozClEj8z/kmyhdkanGFlaafigvJ/f83rHC/j0vtvrTU
	aAZzDxkNJm0txzjp+Vqr+yTe1eF
X-Received: by 2002:a05:620a:6603:b0:93f:25c7:a4e1 with SMTP id af79cd13be357-94421744ef3mr263253285a.26.1793353154643;
        Fri, 30 Oct 2026 02:39:14 -0700 (PDT)
X-Received: by 2002:a05:620a:6603:b0:93f:25c7:a4e1 with SMTP id af79cd13be357-94421744ef3mr263249785a.26.1793353154159;
        Fri, 30 Oct 2026 02:39:14 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d77:8e43:b62f:d85d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm126785025e9.7.2026.10.30.02.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:39:13 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:39:11 +0100
Subject: [PATCH] media: qcom: camss: vfe: Clear active buffer pointers
 after flushing
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
Message-Id: <20261030-camss-fix-v1-1-ecc170342d0d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL5l5GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA2MD3eTE3OJi3bTMCl0TS3MjM0vz1DRLg1QloPqColSgMNis6NjaWgD
 dsvDnWwAAAA==
X-Change-ID: 20261030-camss-fix-4972697ef90e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: __y0KbIt6t5W2EL2u3YXmg1PVOwMx5ty
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX+01KPzE8CngE
 xgbEjPmCXCrGT88USx1it4HUNpShALc5QmqW5QdJMQFM7aaekDHsyyiIo2jtLPjLSioFzREVz3K
 5GiUBJyNWJUOwtRTQjeMS08ZcYkI7OM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX5157LhjoCygG
 fREx9jRUlGtCJLrktGrWQDKlrfWxXEo9oSaZH/H/D/SQXeYRwDcYf5Ozv3TAR4IECbtmUSYif+D
 dfu0yA/1sskjbsWjGbKucDQ6KbFpt06saBA9jNv/VHOZ0i/SO7fVy2yXEceSHo0Ojnn5IDHGu6W
 OKhskLfnCcm9eJPM3CgNUPFzDBbBkJGCCjihiizsE2G5Y2isZZyWbuVKd0NcydQAkXfKs/nOWaN
 qediekpnW5mbLedR7QCIT3DBvVGRXLUW4xXf8uBQX+fbB4ACnnsXYrA0Fe+h1tP1dKwDA326NTW
 YPPl8Z0XhvHbD9RCKuidk7reutyhOv2eyGy+MYMx341l8nQtSNLxDzEAPeYmIqvgntbEgqJHtYR
 pM7sTWgWCUjB7GsFV8z4NU/vEfieuFLGzwCjNLB188TgxMgbciNIq5dpLD6NLtgGHRYz0Blz0QZ
 YPj0D1S27Y1COhMi7Fw==
X-Proofpoint-ORIG-GUID: __y0KbIt6t5W2EL2u3YXmg1PVOwMx5ty
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae465c3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SZjMrJynLI06Tb3JO1YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038

vfe_flush_buffers() returns all active buffers to vb2 but it leaves
output->buf[0] and output->buf[1] pointing to the completed buffers
despite the lost of ownership.

This can lead to subsequent flush or completion paths operating on
stale state and potentially completing the same buffer more than once.

Clear the buffer pointers explicitly.

Note: vfe_enable_output_v2 is supposed to overwrite those pointers with
pending buffers when streaming is restarted, but nothing guarantees that
enough pending buffers will be available to overwrite all entries.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-e617a776-3d96-47cb-8d60-a769340c25a7
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi    | 2 ++
 drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index 361f5163b6d91eef794d3bf86b374d4dcbc6d60f..1ed4de00b1a3e23e1ef0f1c412a2e29bf840c870 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -58,6 +58,7 @@ pmm8620au_0_adc: adc@8000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@3 {
 				reg = <ADC5_GEN3_DIE_TEMP(0)>;
@@ -112,6 +113,7 @@ pmm8650au_1_adc: adc@8000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@203 {
 				reg = <ADC5_GEN3_DIE_TEMP(2)>;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..8e297e2bcafcbf30b09fc2ad6e57f484a4e41898 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1187,11 +1187,15 @@ int vfe_flush_buffers(struct camss_video *vid,
 
 	vfe_buf_flush_pending(output, state);
 
-	if (output->buf[0])
+	if (output->buf[0]) {
 		vb2_buffer_done(&output->buf[0]->vb.vb2_buf, state);
+		output->buf[0] = NULL;
+	}
 
-	if (output->buf[1])
+	if (output->buf[1]) {
 		vb2_buffer_done(&output->buf[1]->vb.vb2_buf, state);
+		output->buf[1] = NULL;
+	}
 
 	if (output->last_buffer) {
 		vb2_buffer_done(&output->last_buffer->vb.vb2_buf, state);

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261030-camss-fix-4972697ef90e

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

