Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DB0522693
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063501; cv=none; b=Qnvp6k0AZNVT7Bxm8CkZVhkd0OLIDIaUfHbbE0pb5Xs6pVxhw9OvtkM7P3qP36zOD0/1zT//h0At6xqUV6mzwg/4G4uQ8im6ZJTjygp3tId3etZiypb9DBqP8R6ELA7BYEsCyggXcxvqvWbpjq0XBZdZv1i4vKU6mq0H8EjBRXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063501; c=relaxed/simple;
	bh=DkLr6iZir28wyBb4Mt08Yb0a9leNjeOw+D9cX32H6+Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ta6DwQ/ZUzctSWV95t3OrDRARoOpKjgTt4G1kn02J0W/8gUP8kgXo2Nlc7RGvDiOE3GbShixIDbD/k2www1iUID7hMDGqyvEGa1/OMsajSs+ZmIQ6J0X1pc1UnOuqK6haLYGHbfvY1GueMDaMqE33HjGSlqtLg3gP/1msN6D+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A51AK5Xi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=huiscNiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A51AK5Xi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="huiscNiF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6vekw3677656
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dXYPR7nHWAjeDaFMXwNLe6
	QSNeIOFksPga28ERzlkeI=; b=A51AK5XiJCW40ZXS+oVGRaFtmwBQxKKF8NAG5v
	a2O4xEET1b9fITCcUHYB3Dye88H7pFgecj4edLajQnzl0gNrdRbBwMUNDrUDTlWE
	78BviVQ25EwMAh1WuItXYPdC5FpqJwDXGY65axpMlraFM1JTG25A7xHfUGrfnY5Z
	JESyWn/UvD87QoYBGe0oTcv87TUlrUhhW3Jv/Ic4dpg4hv7RRx/6fE2iRi66NVo4
	JRnmLAMSNgCS7z6Cv6B7Q/ADAwSwk0EAmZAFIqqeYLA2mMUTtG3QqxjeIvpi/YC7
	PMxDxpbyxc7Eor1ZrVAf9YdJlTAfqBxlbbMh/nD/hDw/fjAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu85vk3nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f925ba4eso584105285a.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063490; x=1790668290; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dXYPR7nHWAjeDaFMXwNLe6QSNeIOFksPga28ERzlkeI=;
        b=huiscNiFi7Uw29ayyGm0jk0yixK3P4uTeqSNUNgj18xAYtgI1y9JgreYIVD/4PNTqF
         s9qtvCM302L9Pxc1HDFCMS2hDJwbmsVbCO88YdKBFxGm6SjJdD2nQqvEyFvpE5VB5QFK
         4xUboJ498vXCdZCMtWsI0DcKNjWEia80mZczj4P2vX4YzrijQeSqsmSol0xzesHHc8EW
         Dbx35w2AYZM4DBB14ZggFTYW7Mz0NbNOc+1X17acTCK+7+/V6bdx6k/V+R4d9LnVsRxK
         itntg4RfrohNVyXKcK4rU7s800onSK5pLtKXgySnlDz6OgWf4pVufNwydaSv8rOzFjDm
         Jljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063490; x=1790668290;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dXYPR7nHWAjeDaFMXwNLe6QSNeIOFksPga28ERzlkeI=;
        b=1d4gNG/q6tlf4qptv52yonPA/+Y1Yg3+bpXr0PDziq/J5yRXfFlmNXIBCbef0KRDNz
         4ds+YAHbvP8Htw7Ebf7MQZQqNRBz7lwzAgkijp6qmlCaxrTyn7SbiHPtBXVngrQcEjUh
         c+o6sKp9oc3qWIgkh1TVjATkZhmRYMLm5D8fjxYb+vZvvN0ix++aDuhaSea/qSs+TGFh
         rlsploziPEUNNt70wuBHmt3F2231sPXrcOXqeXrDzDJfta5zJb6TNHuEAkvGBW/1mqJd
         3m+vsoe+3wH5hSmzZRh2AngHUAVSgSSic8Dh9nnV2VP3CddLFyQvt97/g9Px5LLENhI9
         fC6w==
X-Forwarded-Encrypted: i=1; AKwUvBxtuE6dl60yCNOa2olihIW/hziKNIUB98oCuS7fR/PHNzY6PCQlWNPbFSev1RzNdZtii9bfTSrOkqhe@vger.kernel.org
X-Gm-Message-State: AFuF++nfK8qA/SwZBPRjBIUnEdZ0mgI8124RI68GqpDw/Fy20RzrFXKx
	yjDj/zDKebLiC866c42Jwem7p3e6MJo0glMSBnbYsnUURHFmYFFR9ePMH/sAFPAq21GJN7bD4EC
	hXgeTVO7DNhWgA6rAKd/LimGzTr4I/Oxcv6dQRXEav0l5vUgzUTu1sdZeX9RucENu
X-Gm-Gg: AYBFou3g31pAY/rouqXdi2zfqGBVDkKMywkAMauapkYBkJGv4rBLH7prGyfYXY+F7k8
	vGjvTnl20t1XjqrvCzUQzcW5Kw9bON3eXDEA+weC4JZ0BouNgqwT9p95PRInOcmOQ6t0Sg2BWRc
	Hn7PXH14gndC+go4dwtf6jsJ7YS94IuwnfUpGQ3tjo+Sfn08Nz89Dgkz4xw/R8lyFCJgcHhJ3er
	VS+e9/yvIHhQ7WYMyQezMz11WsUrfWybuFu3qnWWSih5+UEnG9lZcXKg/XFDFA2ByWBAN4E3Bl8
	NWHRPXMyS75m6/+SiIwEb+9NF6kuPyDVjMnU9iqtfCpkBIAu7uK83xiTXwx9p5mbxNujqjKR1rl
	/r706wRAJ
X-Received: by 2002:a05:620a:408c:b0:939:112:d526 with SMTP id af79cd13be357-93c15d92a91mr453888585a.18.1790063489914;
        Tue, 22 Sep 2026 00:51:29 -0700 (PDT)
X-Received: by 2002:a05:620a:408c:b0:939:112:d526 with SMTP id af79cd13be357-93c15d92a91mr453884885a.18.1790063489429;
        Tue, 22 Sep 2026 00:51:29 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 00/13] arm64: dts: qcom: hamoa: Mark the EC reset gpio
 as reserved
Date: Tue, 22 Sep 2026 10:51:09 +0300
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG0zsmoC/5WOzQ7CIBCEX8VwdhuKragn38N44GexGFtaQKJp+
 u7SevDiQS+bnWTmmxlJQG8xkMNqJB6TDdZ1WWzWK6Ia0V0QrM6aMMq2dLcpQccAg3ItNKJ1Ajx
 mQEJAtbwRLr11QKWpuZGaVchJRvUejX0sNafzW4e7vKKKM3t2NDZE55/LjlTOvj8rUwkUaplDG
 neKV+boQiiGu7jlZFvkQ+bmxD7sPf2VzTLbVEJyrKTktf7CnqbpBTWyYQFNAQAA
X-Change-ID: 20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-0bf57fbd24e7
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=DkLr6iZir28wyBb4Mt08Yb0a9leNjeOw+D9cX32H6+Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjNxRIiky2zwou+H/A7FxiZGlxcTRt9t7ilYR
 +ZzXHdqZw2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzcQAKCRAbX0TJAJUV
 VooID/45fnYT5rwVUowEQwjeBHMA+XjFM3OPvX0KDrnedxIqaPALSrYtWNMM813eCu50aRo4e45
 r0ZcBPBGz/L9kpcDKkrjF4bq1WhZKhowq1Z9s+5ND4blGIPdnmgqEhdgxNRMSAH50BuRWyAkO9F
 NfeFy+ItgAH7wEHqRP9vWT1C85C/pF8tzO+S5SQcuO6AoaQWJQAeSrrO2zv9IddD6XCDVvISQ8D
 Ei+QmUfUb9DPjK5QVUT2BwGflsRtySNxg3uSrrGbkuIEFiYkvNz9e0348O84r1ry4bsc1QZBIGH
 03+1eyXAPwCKjuz1TLSg5J95wunzpVwx2amEL2OxUQehojCQBGDe+LKUkajjkyw9AscfnsHyJQV
 ylTGBihtRWlOVsGBLWI0tAGgnbRDGDbwMVNbm4ms1SWT/qPcdQ0yPRUbq4bJsOEkG5eCuRtobc2
 3BSzkWVsnIycagfChas5VDrrhA3xxnFBseNteLiaG5Tt62xvIZInHvKfGHXUOw4eXmxtexbZcuD
 FcDxG2QebSau+H2WaEAQSWAYg6jPRBs7+iY/avLbfSdlNx+Rv8j1n+60vCn1N20BjO12yAYf/eh
 BK5v2DQXy1DpPMp/czHZsZ2KXJZarkMOCzcDp+CZnMw+qjlX35K7ZdLIvglk7MQ2ufq4linrXk4
 RJ2LQEv8a35nGfg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX35ECO94+UqPS
 bMW65HEdcRCeCHmEXPSNOEd2I8ttf4yp2nPI+wNQaQ7dxGM/QJTVsBxEDNjIqzs0UdEBWu7iMp8
 Jn0KfZEsKQDgQrDDeZyqXu1WBHgJ5Xw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX+9ifQVNc2p2D
 DTj065P/uNnWWBoZpmXSMfCXDaXTd9wi5gHQF8MhZP4KYz++vISTFBI1adG9VSyxGMsB21zpeiV
 o1aH2YZQ5t82fwwXr1ZcDJERQTJVMu/7pAaPSTKQePMnUWknS/Xy4kRGqZ6qLik5QVwv7F7XbY0
 Yh+HJ0jRkx8s/zrkgN6aG3zdbIiZ88RVow/yS5bba3jIvXhIPxV+6E2Add2TyaB4DRpcU5dLWuy
 hYV6mSi26MULYYnZa2T697mOpS1FJzlcP/RN3PqctjJMZj63n/k0Ltl4zbV4tZ3VfZwY+ECk75B
 ZX+fJ8I2DRYiR4KoSfN6MQpMqg85RJhUMFvGr+seO5tnwBAX9iUaig/pT8yHQKovPjsDvv5SNhO
 M4rDcAWZ4UWlRCigOCv2taDj09Wg7PBJ9j3Dg79/N7YUJT4Zj9/tmwme9ElEkGIKmhzsjzzwPie
 wNN5NwAWyQ33iAkTjXQ==
X-Authority-Analysis: v=2.4 cv=E8FYNqdl c=1 sm=1 tr=0 ts=6ab23383 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=yDUiu3_GAAAA:8 a=iLNU1ar6AAAA:8
 a=gxl3bz0cAAAA:8 a=X9uYJ1hcyrHnrYopOo0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22 a=gafEeHOdjwYkg5oUpzAY:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: PLd39Zq_r2DAFzRp0za8w7TUeCefkmsR
X-Proofpoint-GUID: PLd39Zq_r2DAFzRp0za8w7TUeCefkmsR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 is confirmed to be connected to the EC reset line on the CRD,
QCP, XPS 13, and T14s. The same wiring pattern appears to be shared by
the other Hamoa and Purwa boards covered by this series. Microsoft
devices are excluded: GPIO 65 is needed for touchpad operation on
Romulus, and its use as EC reset is unconfirmed on the other Surface
devices.

This prevents Linux from toggling a line that can leave some devices
unable to power on until their battery is disconnected. On the CRD,
asserting the active-high reset causes the fans to run at full speed
during reset and leaves the keyboard non-functional afterwards.

---
Changes in v3:
- Rebased on next-20260921.
- Dropped the Romulus, Denali, and Surface Pro 12in patches following
  Konrad's feedback about GPIO 65 on Microsoft devices.
- Updated the CRD commit message with the observed effects of asserting
  the active-high EC reset: full-speed fans during reset and a
  non-functional keyboard afterwards.
- Link to v2: https://patch.msgid.link/20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260831.
- Included fixes for all remaining hamoa/purwa devices this time.
- Link to v1: https://patch.msgid.link/20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Rajendra Nayak <quic_rjendra@quicinc.com>
To: Abel Vesa <abelvesa@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Konstantin Shabanov <mail@etehtsea.me>
To: Srinivas Kandagatla <srini@kernel.org>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
To: Xilin Wu <wuxilin123@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Val Packett <val@packett.cool>
To: Laurentiu Tudor <laurentiu.tudor1@dell.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
To: Dale Whinham <daleyo@gmail.com>
To: Jérôme de Bretagne <jerome.debretagne@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <quic_kdybcio@quicinc.com>

---
Abel Vesa (13):
      arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio as reserved
      arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as reserved
      arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-asus-vivobook-s15: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-asus-zenbook-a14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-dell-thena: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-hp-omnibook-x14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1p42100-thinkbook-16: Mark the EC reset gpio as reserved

 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi           | 1 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi            | 1 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi                  | 1 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi             | 1 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                 | 3 ++-
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi  | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts        | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts     | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts  | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                    | 1 +
 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts    | 1 +
 13 files changed, 15 insertions(+), 2 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-0bf57fbd24e7

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

