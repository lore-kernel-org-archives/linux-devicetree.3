Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CF537F75B
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042297; cv=none; b=A+Gd/FndsRwKstdz/jNwrAnXIU5eQ/8gxmzlNmEI/dgk3XaXVds2KtsJm9z5jKNbMKSyQeKZvIKd0qc6k+4GPf9QzSmopR1ahk0IJndKv6etY5e4CCCPES2pQgq7R1GBzYEWGJDDQI68E1hn6kRbZkACDDPcZN90ahsLZrV3MP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042297; c=relaxed/simple;
	bh=gctHxb5CeHNe2axULrIQ/z9ntCHsYPv+bbIZgiI2ems=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHXAuqpsJAT+1mwbNA63Cml9ydRco0omObD5xz5LDmB46P17fKtFs5Xu6DjLip3rsZVdpWDTN2jWglQZhm2i7izYW2kumvhfF8hAfHs8nJ3C2E6TQHvoB2h9FtWn8xqZ0EBTDbUcsm6tiuYS7H4RszUqFAcVkeG47gkWbQikib8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmyeQz1V; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmyeQz1V"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so36518926d6.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042294; x=1790647094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbYQNJJ7cs6bqg+2N1+H5xlgpLBT5L5nS/rdjvSWGlU=;
        b=DmyeQz1VPf2BBo5XyyQApUfvfUnoXlVoLx9+Du+PtnuUDEojmvxtvq/4T2XlmW5vXo
         pviMAdwXipyYxyjS3Jco65kiAijHkXAireY3FqECb7D/Hs0kZfSbgftDNgOozw7IYZmT
         Hw7BQ0eLkxK9Pac7KRwerg+65r324X+XfzBSxUDr27DH3xLOMG5GxQbtUIGRSIbRN/8L
         Pwo5kwpzkoxmDEeiohlBh+VVOpV5wjCi5oYSG+Q+rT7x6Y803bM/Zu952oYX3XYAOCK8
         Prk7sJ8HvSblh00jAQM6d7S5zMJSzGq0w5pwB1xB00nl0opuS3fIvJekBwOc7dCj7j6j
         QqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042294; x=1790647094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LbYQNJJ7cs6bqg+2N1+H5xlgpLBT5L5nS/rdjvSWGlU=;
        b=y42If+UT6rDLaOOKB8I5ATulGfRCalnGk1G/A1WmmgMcAgWHT4lm7MQ8GhTeH2Luwl
         ngJC6pQ7kwWUTlqs6+zUEhhlEqKRKnQgQOeFyKcfV4f52D9obFMQgYNYpMM+zwcvBNZ2
         dP2zl//z6FGrnzNULGiug0nDsS3BUopn4aVJD6wRdAo5ZomU3SGvjp5A6I+k2CYvjfxB
         tWHHlGAXCkL4kkvpfRcOzvr9B+Ff2BgxDRgUs4+sajp/ojrpREAP6oIqmyeELMZLi0hw
         f8VZZY1o+SmGfpV0agKkAkwrqDpYglxIO88Emx8LmGgf7C+j3nWSQj9D4MPGX9HJMMfV
         KW/Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8+u1gAqyXn1auU2caL2wUTMFk1YDTUVLP3+E4IEvPnjfcDvsV87vj4IBrgr8INaEETKbI2NKXlchK@vger.kernel.org
X-Gm-Message-State: AFuF++lYG9CeZhHqHcZp1MrM9/jvtSjxsJEIIh14UW5+BvV4XM9KtMAl
	qdtjjPLhN96KW+5KtWLJoRj5A6Ycqxjjlk9clbweGLlIph9RWVJ5U9od
X-Gm-Gg: AYBFou1XOFsZ1gPhDOTtlhq7moLOrPAi1NOIWgn1QOgyKeGA6/7w5zvws94v1AlyxdN
	CXCgrz+pzdTgA2mLhkw3NiRJ+hUzTqXMXXzA1sV7ZB2IRt8kjc9nehL7xQkC9JvPRa8HfyBPIDe
	1BixlGh3bLjcREJejrrKKnATA/IegKx922onzflXnM8jS955mMqIOFZc7139IuSPqbMocR5dbCw
	OHE8zu2dVhbHPMIyjVejrtyVxn4UBnSX05m66PpBpVrM5lUq5LLneYRdYSP6058Smx3sZWhB8j5
	XzdoEwdp96fyDLLswPgD6crR/SboyjTYfwoETYffkIxWxYgkS0sGURQXCocEr5qOM3PdUkmtrbU
	5S7153EQNJNzvshM806ykB2umVIlUlaXwWHdrtI9dTjWrLMH7DkNX8MzCgO5ES8bYyNR1/WHTEn
	mqZqh205m7ubbs5kYC02KXiE0Gz6LlE8qOzuBQoFAntgWqNiOpGlAXgm4UaA1SgUdFdcHKZTxcN
	w==
X-Received: by 2002:a05:6214:19c7:b0:912:517b:8f5 with SMTP id 6a1803df08f44-913fc95111dmr35899676d6.39.1790042293778;
        Mon, 21 Sep 2026 18:58:13 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140250a43asm3952866d6.38.2026.09.21.18.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:13 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 05/11] remoteproc: qcom: pas: Add SDM670 ADSP support
Date: Mon, 21 Sep 2026 21:57:55 -0400
Message-ID: <20260922015801.32373-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
compatible for it, with the same data as SDM845 since the driver
requires the load_state.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..5272a462fc49 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1865,6 +1865,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init },
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
-- 
2.55.0

