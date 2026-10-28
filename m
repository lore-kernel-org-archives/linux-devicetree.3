Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193274;
	b=cND/3nwI8OOURdoiFcUPODkXjVnwyQjZCkA4n0tTuwQAflW9znrMUSXG+5eFi1A9OdAY
	 Lu03AEbDhqIQfcQ0NQkEQmjO2YGMokJLyNssP2oI2H5z7bqmgpRTer1zsIw8oSfcYpBNr
	 sPJ3Okqfh7DOHhl3j8ry8AZR91VobjxSAF32K7JC9VQrUGhSqCZrLNClypczeHOKmYk1c
	 FfprU2XH53x6SFplPwpheuLnVL2+JZp+SMl/2WpxZ8928lgc7OeodYXmnYz05b6C5zNoB
	 zYam/TKUBI5WMNdh0enIIgM1uwF0DgQyZtelLRYetbpqc6+5J/I7rPVqC99Z9SKXMsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1x8NaV8HTu5gAeslmvpR8FGTVuxugxIE8fzlISP3bnI=;
	b=MdMZe19QYbq9Tr19vsCI1CAssopspITUgRsg6FWuqtuHJxKBRV+ktv2DPtfnTtECneeo
	 3L/Kbjv7XF96sq7Bzc2pUuKVrFbQg8ndLP4OrBwddi/9qBsNic7Tr4b/zTc88ZHUxsamo
	 kNUIRq0DmJQ0yTas4QUXixxU/gH1PGao0T+HfvQiAzCPRgEKzXvZnzN15EPDi2fZD9tSD
	 cchQV8R8474taGpZ29OEDcD5VP4RRRxDOsUbLcr02W+Uj2DgM6Vy4+n0UqywX3K0L7pKh
	 YAZ5SnsvArMpeNHnCWy/pH+o242ta5tbGvajYnEHa9fnHdmvd9tHGU9E2Syc5rtlryg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D9BEfN2x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h4Vvdl+u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5896606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5896606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D9BEfN2x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h4Vvdl+u
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2qZ505389
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1x8NaV8HTu5gAeslmvpR8F
	GTVuxugxIE8fzlISP3bnI=; b=D9BEfN2x/o5w0fry8gHuNT+065VJseNTU4AECb
	tI9MxVxRvLwD+SX/3G5IxMMQvuy6+e+S9c1np1Qm5LkUamkZqRn9k6apfDfpVVbj
	nn3S1rR/H9VAVQt/tBAO7eUQ8QH9DTzJy6UTQtGwrcoNtfMGrJ79hnVvfM/JWXib
	HB+rMY7+fmQotBA+bCu9g7f4YbBgKbYB9cjL8qdyTeOGs6LyZBDNqsnaOQObjfBG
	y/iHys9SfqO3SynMjNa7TrXJN7qayjqtjkNYGgRZQ1l0vYhdRizIMx6C2VlkZy+6
	JEvPYM67qoGQ/5jhO/0FXg+A7ng5dtzTVzjNCKncjxvLBHAw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g47qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:14:32 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-70339873137so962319eaf.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193272; x=1793798072; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1x8NaV8HTu5gAeslmvpR8FGTVuxugxIE8fzlISP3bnI=;
        b=h4Vvdl+uUBawzI83pkPIQuPRjI+/hWTab2r+6ZEOjhKX5TBH1tSvaSbpZYyyoEla51
         PnYzdgNbSAOR8YOZOu4X+dTFMtSQH3VhQuRX2bP8fVynLqJlDgFt9ptOTp88ioCcwFUZ
         zyJhFf2YxYTbPkbtHSoqhtrcELxrmWDaWj+GOfADzUcmM/BWL1OBGw2y8AbvVYTzo9s9
         15URYorqEkAoyH8BLO0B88tjUH9lVWlWGYfkj/JjSR6eq4VOHZIXKBvpdbAUOjUDtpKO
         Xb9qg+yYEDY3Ky0hUDb88GQKCSu5WlLPAENeIv95oP9eRraarXHgEEL9LCgsNmzEaLew
         l+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193272; x=1793798072;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1x8NaV8HTu5gAeslmvpR8FGTVuxugxIE8fzlISP3bnI=;
        b=sPdUGuKqNZPgZokF3bbANNYkHz7Zi/9fe8t1GbljcJcf7WY7J/NTF9gAiiw08jn01T
         5T3mL5JzXu5uzxyJHxoXbxqZzgcLZOWKX4NBAYw2MRP8tt8pWFk8kya3FftOzcg4aX+1
         Qp3ELnB5YUoxVmSOaeMqInZchablIVwrBOz/JqtEybEDaB7xZv+DeQ7SB1oAwvlz4gAe
         E7aEigQxO2P8ncbycfNeE22/6QicMD1NfjOih0nObWbFrJEPSzhtq8rx/iWxF3ewq7mM
         yh8GCvjMyINqbLhoWKgQMUEe17iY0qmar5ERl7DQ0YA6J1RgrZ7XjENxRADYZ5yvQZqQ
         kK9g==
X-Forwarded-Encrypted: i=1; AKwUvBxlzutUea41KW9caUbw8aWUjydP/Kh07c+QdsQ8WWkd7lrv5gFOXhEyQi1mSVxZxGSP1QdoSKtvke0z@vger.kernel.org
X-Gm-Message-State: AFq9FYL/7M6S7lhjuqO0rJKYXd5udb0DGXvpnlIGWQfA8WxNhe40p0oh
	49Y9i8rNgpQuBHOdjf4IzbAfcJlZrpcEkvcUAPSul6FMLIywV35mmD44lDa0cxtLzO6jQi7dfpd
	yJl8y05oZsgdysHRSQLPj8TUZX5vw1V+dc/aaJjzQ5VB5Oz+ikOdmDY4SeVnDaMjL
X-Gm-Gg: AYBFou1PpFJ70mvtRMOdZuvh8/1HmImQk9ZglII0p1wA/pRzE6LkiIrXYb3I3mFvfBw
	yqBxMnyqIOn9deFDH7ZoguavHSHde0jmQiguRjD+wun+CoZ+r5A2sVC4ymzziXTjo//24a4lZAA
	y2eLyPt4BqhOzCzn+mtoNLfEpt83Rrd9qw+/FJFsdEUovlUz+dxS0w9xv2Gjul2aaPH+Bq5QdKN
	6hZpkP7k3qzWbNr3MpfctkuFekC2LtIEYU9KAcq3k1jg/To7s23rC9uSwg+mL4zOOZNSmEjG5y2
	MsskW7AeZkZMFX1zkVm4eTOfhcgJho0e9ogGFWZtOIUqcCdbVk8ocAGFdqdrnf0wUxJyHjjuv1D
	nHkEjdUzox63LlWDGyt0eWB0d9xT8KQze5+gdvHcMrEU/XbHkp9gO29B5IPz0ZWp9+wEwM12N06
	lTePaHCrf+
X-Received: by 2002:a05:6820:4dc3:b0:6f8:a519:d932 with SMTP id 006d021491bc7-7126ca44809mr3108345eaf.53.1793193271788;
        Wed, 28 Oct 2026 06:14:31 -0700 (PDT)
X-Received: by 2002:a05:6820:4dc3:b0:6f8:a519:d932 with SMTP id 006d021491bc7-7126ca44809mr3108326eaf.53.1793193271362;
        Wed, 28 Oct 2026 06:14:31 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b788a09csm2388074fac.10.2026.10.28.06.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:14:30 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:44:20 +0530
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Add pull-up for SD card
 detect
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
Message-Id: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACv14WoC/yXM0QpAQBCF4VfRXNvaXZH1KpIWg5HQDiJ5d4vLr
 /5zLmB0hAxZcIHDnZjmyUOFAdS9nToU1HiDljpRUqeiG8+Sl02YpJWRim3UGAO+Xhy2dHxPefG
 bt2rAen3ncN8PYNq8HWsAAAA=
X-Change-ID: 20261028-gly_spu-96f0315a3d99
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com, mani@kernel.org,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793193266; l=1176;
 i=monish.chunara@oss.qualcomm.com; s=20261028; h=from:subject:message-id;
 bh=Ty8iQjHsGQajgTDh0m+gmK4J0o90jMAVhZuq2fkNuPY=;
 b=6x6YWK04xaRVG0/5I2sTwxDR1sy/HprH5IUZ2V3JqBhJQEHnbOWi3R8P2hH44si9M5d8AB3Qr
 yHS3KJlAuF8B8vKiGahC1x8/Fi0S4smi0qKL7VPYJo/QSm5u3j2mz+G
X-Developer-Key: i=monish.chunara@oss.qualcomm.com; a=ed25519;
 pk=R2RFu13c+46gfzaTikqwEg+aoiYYnnwa2sLE2QOs+lY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX/fakMNWHCZnV
 g+roU6reOoRJpdpaow3pZbb0R21hReNrgUkH4ngVFSkMXBCsmjAubB6ekHlshciRdzTixHFIeol
 eeMTqL4uYTsBLaAMijR11fLmr6rnNVIQnfGCfUwE4TNKh0vJWwz0KUYRbV8DDm7yxuaY11lSfY2
 QNR/NYEzrMadazwpHVtMKuEy7DlRnxv9LahB2IP2bL5A6DQOgUhWsUS0DZO1rY7SEN8MJkflV0K
 kCPflCTpkVsQjE+1LHbzf/BCNcGNL0ghE47CFmcy7N0OOcD1BsL1KMdli5YhTQpLdyRysQY21U/
 cuUZakjTt4VtiYa/Aa0SL6Kr1k21kG0DKR7MRozFFTLxRmC4sCLtVNrTH4Gxk0UxfUoVEqkVWL1
 GpF9WbjEuDA1/PC4UFqWdQvng2itliNIfELxPwmTvNqC5OWf5Yd1Zvc968C39ANHL8TZNmsGF3W
 dFTTrRbH1QP04n5SYWA==
X-Proofpoint-GUID: motElbsEm3maTT7FfugU5JCMA0-Q9EUj
X-Proofpoint-ORIG-GUID: motElbsEm3maTT7FfugU5JCMA0-Q9EUj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX2D8G6uGSiKd+
 WOkqOATfuXmz5dnuKgjpA1YI96TS1leAPKp8AFOx+jTmV/qT9zqtqazhAkmL3ZkDF5vQZby1lq2
 6fVXryMiIpqN/wplazq/8iSEtGQMBeU=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae1f538 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=06sbhgvwvL4e3_yMxJcA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052

The SD card detect signal is active low and requires a defined high
level when no card is inserted. With the GPIO bias disabled, the
card-detect input can be left floating and result in spurious
interrupts.

Enable the internal pull-up on the SD card detect GPIO to keep the
signal at a defined level when the card is absent and avoid spurious
card-detect interrupts.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..a8f9425d8c77 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -1110,7 +1110,7 @@ sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio221";
 		function = "gpio";
 		drive-strength = <2>;
-		bias-disable;
+		bias-pull-up;
 	};
 
 	tpad_default: tpad-default-state {

---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261028-gly_spu-96f0315a3d99

Best regards,
--  
Monish Chunara <monish.chunara@oss.qualcomm.com>

