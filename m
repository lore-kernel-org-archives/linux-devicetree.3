Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB59483BD0
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390165; cv=none; b=oYIC2+nRnOtKhUhyNNUY77FsyK6z/CsZk78eV2EEjK9GQzM1jukF/LMvywtzd/FOjhmR6g031nEZoRiopvUmUvQJAgeCKMzMU5lkKCKz1yk29rjQb84YQ1m2zeJldnVoKmmAHb+opEILzBFmbkFA5rkkWV9Cc5w9fCyWVW4qGYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390165; c=relaxed/simple;
	bh=wjUHiB/Fb0vvpnlD884yzywLf/3FV7pA3GwZbrdjsds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uXElytQafvten+rjfNjcubMzX/VoEoChTGFTkKqR4WRsES4GALddOBEHdvz9CdbyykoHcDw4nKgU2eVTKRhHxl9/qrVFO8Sy9q7OzDB65cVTs/b1O3XJlUqMacNPdXwxwGtlDwXiATD27Nyh7YmqEysrwus5OxWh64z7EllWT04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gazYWWqM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwOiNDYS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gazYWWqM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwOiNDYS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmLfV4032464
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hSosOcHkZaTwqa9u1d4bkCQ8v4iMfRbD9GCeLmqFfN4=; b=gazYWWqMB3jM7Cyg
	BgRDvVDWrRlB9Ctg3KjE9g3227lk5qnb9t+5LB33ZcAK6ySjsnin1kNDoJep4d7s
	mPR2VP0d6yHiP1etoqMu7dJjCrK2tEFh2k9K4NgUzy/8w2g9I/RV/bVL03w55/U+
	aT8CwMKXxiQR0aBS8lx3MqlJzJNDSUcoEMVnskRMkkMMaqFCoYYHhbd9TjQmV9Fa
	jRh2uObIRF4oduz9GQHphg2QRZx6OSGBMneF+1AU5+nCQKjPNC1xpDi5xTcShALz
	ADInA6L1br3N3NNsMmGooW4qyNdg5ltrxIAzyF+z5AYhag0DCTxx3CFXss6QGbyf
	8wpJAQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8krf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:23 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-785827e6073so638869137.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390163; x=1789994963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSosOcHkZaTwqa9u1d4bkCQ8v4iMfRbD9GCeLmqFfN4=;
        b=ZwOiNDYSpE7n2scVrLYOeBoGU4Vx51RtEcI/QyTUYOrfkGs7OPTulcWNFpi+4p25Gl
         9zNSIzo8FyfszsS+eoM5kYeENk2MmD+GwRdgLTL1ryAIfahgepkFgzLj8Z7/je1KG8OQ
         AL4FmvfC/iVKvLyJQ2rVRWmRE75ezA1K5TU5W8Mkz+HatOMIL3cEpGwh2wEMj1SOE5NF
         267rlqTBQVcg1qLcIfH4GTfDzaTtvtol4tDn+O5Hgl0FpB+Hf6b4p+tpfZel5F6VTuNt
         rl4eWruG23AekdsAmmOYYCaoZrk98cqp1HPfjfu7ZEojWzniEmi///UKYdpLLtsqAjZE
         SCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390163; x=1789994963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSosOcHkZaTwqa9u1d4bkCQ8v4iMfRbD9GCeLmqFfN4=;
        b=R5yPZqOwEX8HHI/0fHmI1e0tTh3vfz0kqIdfdOMoM09gOfsuAeMwswvU+k8EFiAUCm
         f4LxhjSnlsmsGm5UF/jeR7bAbND3mrtEoKSUC2aL1auPuFoQT3BnSk1gYIqrvh6eMF6W
         iHVKibf2bu9Sik//s3lx152pgXxkpFNUaQK+RdMdpUc96PT4iVFUaNbuOZTptTcBUBZ8
         sm3GiCV8HYHOs+LxYlpiJaeqtA9opVj2g93jzbHhKYXUP4SgIMsv+8eJQRDBKHjU0jzU
         LWt4FGrg086TSONb/79Ot4ERd2ROt1Yh19E+m4h4R9dMaABnTbjlyR4sytUdPJ9i/J2N
         Ostw==
X-Forwarded-Encrypted: i=1; AKwUvBxWL6mh7N11S+5+rwNNj6Y6/ZmIPX8Qec+gIKq0dck1VkxYHLVziJxEOVtNXJSWyxJv53J49ZWpYiz7@vger.kernel.org
X-Gm-Message-State: AFuF++mdVcPl4AarUZZiOuGn4PC5JvghZ1ur+j2sXaijVsPDVHw4FkTu
	ZC29KBPJViVSZRw+m7BoA8hy+R0D2IDndvKLAVDS1tSUY0qwb1y0oFDlv5s1G/01XA5SNo9z+tJ
	r84UF7fKAjxNXqIW4BM+ytEhqslAEhC6JUYb5gB/zF2UAhW5xOTZSU084XiqEwey2
X-Gm-Gg: AYBFou2L1xTyGsi7+aNgAh/iFrxvw7Ocp48DNRd7AVObPpQ5RY++7pp1UxRUkS14mYa
	JV2hsJaNYKL8Y86B5ADNBfU3HVkiarzxgFqd3uoxpAvAmK2uUkAYJlWVEDGEKowhAHWXs00tdsE
	P5w4bxSPlt5PyUCrWKcDYpRQcZsG7I/Gw7+gb5XjTP0tEG6SKX+/+kSUDTay0VyJcOeLX6qYQOb
	BI94GU7LD5UcL3sYGhSGDQk/K+hEyLPB19mp6lt5ESxTeULb7Z9otFGV4QDT8yRn8lUyZ0EzxyX
	xDrU+fTcgiWDNdecwNEbSlMg3qkPAPO8HM5UeURvSoAkNu1g5Hdgs7XotizD8+yrqwDZ7ziqYIU
	m/xW2TZVE
X-Received: by 2002:a05:6102:d88:b0:79b:163b:d5a6 with SMTP id ada2fe7eead31-79b57ea2c98mr1201218137.5.1789390162481;
        Mon, 14 Sep 2026 05:49:22 -0700 (PDT)
X-Received: by 2002:a05:6102:d88:b0:79b:163b:d5a6 with SMTP id ada2fe7eead31-79b57ea2c98mr1201195137.5.1789390161958;
        Mon, 14 Sep 2026 05:49:21 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:29 +0300
Subject: [PATCH v4 30/52] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-30-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wjUHiB/Fb0vvpnlD884yzywLf/3FV7pA3GwZbrdjsds=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zoQML6Rd0z8rn0uEZfd9jYuz1DNhT+R+iEW
 ACrFhiU8TOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs6AAKCRAbX0TJAJUV
 VqDBEADHU2OIiSSk7Gbv12nKDJb71Vws6gFi9nZtC1MSbBkju8az2AYVACfLb9SZ4/hVBjESicE
 2vYNabV2Jopjx6VSK8oLkzJ8tybK81CEGhqWPM7U4quUU/lh/u0x9fn3h32XgflYlsiZjo7z6c2
 S/8yI97BqOXrP5LJXVPSN2DhZwpnmXf4TyAKHJb/wr4SYMV6yLaXbGFO35BWXYmRndK07BFYs6J
 SIMIP0oNKi9ojAtbjARxHGybQoEJ14vyCqOSAxENfIeMg6xgwiTxF/LMK+Qbd5DBI8XJGJ6BixO
 jFUEn8cvSW0WM4n0AFWHp//ixN2enNY7h/dF9qcEifWcx5LVztbzWn/VhhtP4y8MkqgmThiGXjr
 0w7t3PJz/RAgfZx15QfZ23SIuCTvc42i1l7tK3/ec6yJ2D5PE6Ux7kvBz8Nl4sMbte7Ef3boOjI
 v+G1gIBAk+GPQVePmQzNI3J2a0m0r71YxDwh24nMb/IP0duBalsbZfUllHR5sPNvm8gLXz3q9P7
 vWCZSQWOansnb9hqkaE1FvAMjvkFCsclWvD9ImpUBf9M2+kSIuMcFgGN50IBjCWHLy6Hjl9Kf/1
 G5UVRo+R+BX1M7vvvZElCUEheYT7E/ffH9nmTOSZ0g7ZRTakjgaaNENUWhmxQJu6TFrSFI4AKJ/
 LD3ZTg+ipp4pCXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX8i+eN6fCe2ri
 RP98Rtouian20RO/OkZliLkuRDDTEZvWfyUgqBiz4By1Gu8UY02JSyF/tw5hjzVUlHtuLjjYbjl
 UgCgOsWN8jZ9yxy59Jzo7C1H6vql5iG2LEwJqN3QVdTIhjPnSPPSN3GoHIyoCIFL+cYgnbdq6to
 iP+qqxTuUAoMWgzj9+RuVIwwT+T0EENI/v0LYJiHZFpPxm0wZpsZ0W5ezhMeGWfhI0Hyc2dr0Tj
 EVON0+Vgx9LXuHEdBE2+GhVfOtsp/RpiQWAqoT431rxjn/NpIcvhVQAucq+hxi8IBg3LFCvkASc
 pBa5vaCikQ2mIgiR7NOwUV4DkvT8TZ/30bUeHxML1Z2Q+r/sVO37/c08zlpY0qQL6PmJOVJBEgX
 8JdLnPaQYYOmLuNgPVwFd1IBQTMA1JonbM4ov+0jVFTgZvi3i/glPo7+Ix1TjiwKfYo85/PQRv9
 lRbdPziMu7ddIxaLoaQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7ed53 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: P0TVp7QRSKHaE5D-5R7mS4xIZtcDWfhz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX0tnFFo+B6BVg
 /l+r7nikh/B2Fd6nLt1HHVfqDwHSbdN6WVY9FyqTuR0E3crjBreWNBydutVnpz3djdlZOg/DAnq
 cxjm+yVnKAimEo/Ck+JizfzWdsIYc7Y=
X-Proofpoint-GUID: P0TVp7QRSKHaE5D-5R7mS4xIZtcDWfhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 1c59d70e0f96..44f6e197433e 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3619,6 +3619,7 @@ static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8250_resets),
 	.gdscs = gcc_sm8250_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8250_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8250_match_table[] = {

-- 
2.54.0

