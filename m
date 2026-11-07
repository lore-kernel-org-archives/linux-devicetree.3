Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018357;
	b=nR/hWvLbwaOvieW3aCTUbulI1JSrUVWmcle0LtrktM4YbiN4tlpll4qzmUZVXO0nDghn
	 xfHrQgq2HoEtKQkbB+kyLZfOD6IHybMmPaxVw2frzITNzMsFvgsK8kVjAQ2gI5k/enmR5
	 83hzxAn+aIGtvRNJXNP6G53SahnHnd3cf633XmHNiI6x7rfGtSajkayC+pQu03Bh/PRxJ
	 dRtRHXQFiy5q+muxV+dVC8pwfCxywPAvXVX5cVTqmpD1EPNXD3G8JYi9QkJ5IRah5ol/j
	 5c00Bcs3OAgVXHkm1emhDTB/n6yRrwWbekAd5oDM0p0CbILMUvYBQprfhz3HQaWp13Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B3SGzHlgY8odIPc0vKXo4UyX1GU/XLl2ljqE7iQ/a28=;
	b=QnBHAArFZv1KKxXws/Llm9nW4aV33Lb3qTiLhM1CQjfZLayPz165if7pZO/IjXTV1+Zg
	 UWmfpIRLitT8o6rbdpxb8lEqr0HQPf/QYe+5RWiyfN/cFu++LzmMmel3J00X2wLktSGIp
	 EefVzkziyIymnFGNebJTJNmOYZx6Tne/pQSDuTqtSo3lKBIyT2f+IOHZDTyNffo/mX454
	 hc7qLx1EJFgaoUgr6Qq+iRcjscqUVB/NRaWKPo5a+848Y+2RO2Mznjk+h0uxIwcb9xDhj
	 qncHVP5lv2tPVlaMtdnbbzNa5xmW0cCxqGUhGjZKsmMZiN6KBeH1MGEva6q7M+UxdAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTeLhHPm;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2577606A32F
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 02:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2577606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTeLhHPm
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9908e3cd939so308747241.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018356; x=1794623156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3SGzHlgY8odIPc0vKXo4UyX1GU/XLl2ljqE7iQ/a28=;
        b=lTeLhHPmBNApRqmkaGG8d9jRp+H2mIbSGZn1OPdnd/OK8qL5F4IM8rppC2adeTD/b0
         FRKNJBT/jErzUjnpfmJaZeeV6QKbZYRaXB5k0ubAn01Nxvl2t4Wa8RbFQ3AdhhJY2Fzo
         Pg94g9hSwiJ5QVI7W583jGP1/fX6n0pTJ0MHLJSuIL5n4rCFRxBIF6yfYlFThAotdsiu
         NWqFRJ1YXzHNhFmSl7PvogYjMvNT3rVXoank8ZD2VKfe2BlUGI6pWsVTJ6lQ+Ff+JNk7
         Pxwm0vz+VynGt9wAWiWqyFh70PxDG59wWV1ntpiR+FJI0ygrAjDwV2oF3B4zMB4z43Zc
         5mIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018356; x=1794623156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B3SGzHlgY8odIPc0vKXo4UyX1GU/XLl2ljqE7iQ/a28=;
        b=0iyyIAIDpPZs8U48Q2R1j3+mcMfeei+grD4cgy56eWghXmIbSvX/xOg0r+8xsI6Gcu
         AppMribCpSA6k7NP3CSc90ZrhyX2NbrySFtmzHetKbTIkJKK8lPmfvs7BfDd7NfhMLWX
         z9c2HuiyZA8L4KnEKwoxaAWUPbTigkgNbhNCuDoX0l0KsAtjvpzseSIjXCXhFoFLSB9S
         KbIhqKClbWfEqV5aTs1tlU/S7ZmG9H0juBPZShhq6T3YoaTLhws7TUR0hOzrcbq6zrXj
         pJCjgjJTMXC5/bVQWCF7LKzQgvNO+Q/gNTtkLLrJiLVwd3rcm5aFPGX9vdr7ROFlVtdO
         VTXQ==
X-Forwarded-Encrypted: i=1; AL+hErGg7MbFXPNr7Wb2iat9U6p5b5hdVDkSqoiRrVKN2wqfDbHdzfBCCtQEZbzzh0hizPQwrLxBy7h84mRE@vger.kernel.org
X-Gm-Message-State: APuU4Z+qREIKJH5Cx+achbLlYVuCHxjAYU6X4nkOhOE/EEN4ftoDXf92
	1uxQY4Q2S8pwsb/58afFJ4bDcNHHksSfZ2sv1OJrS2PMTVGX/b0aR+nW
X-Gm-Gg: AYBFou21gGeYd7ZgAw32gmfisoNJtc0YI/wXb2ZuRHwlGR/oLzgB9++tO0ivEt3ZWSe
	8Dc+6vVjCm3ac+c9S7RM81er+f9ro0zGNzHbczbaamIo3PTfosbEJgvwZquKSHkt9xSWK0J5VGD
	92DiAhdWyy2ruzWCd8xIEL7WG8huMpf28lGmeCMBnqCthyt49Imk+K02+eP9BFnJMvxhK88MT0F
	p1M4YdTn0KernlITUR9LkojFuqYaPnFqLqiAOZ+nn+cILzltGo1IwM7o7izQw0ASy1VCan//WlL
	+XCAE2zzMrfvXv5pofrSMy7WmOLq+xYtTFLA9BAOFmZuGpA6BO6eu7I16GevRd8gd392wmYfoiV
	K1OyJopaAHG/6fqSSqvneGpwGXAEjSWKIPMsg74Y2gVTqc1kM0bRoPtjZL5xt8xIWJWJDRRCPtK
	4mBxi6PoiclZJCft33JIuBJlG9Z2lRSe+GZMchrEzy2gAWV2Pcic92K4ieGiZ3KKosYpbOcnzaN
	kagLgcrsQB8jzId8jKaR+tDMq8oTqGj/Gnjzq+h3xtGTXQnA+7uEB4O83wonHU2yozQL/kPjkKq
	0KLhLiNcvn6WYQ54laIGbJg7NKcI
X-Received: by 2002:a05:6102:15a2:b0:7cc:2fd1:7143 with SMTP id ada2fe7eead31-7d2a1593194mr1895441137.17.1794018355909;
        Fri, 06 Nov 2026 18:25:55 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99bab48acb7sm3106680241.1.2026.11.06.18.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:54 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 4/9] remoteproc: qcom: pas: Add SDM670 ADSP support
Date: Fri,  6 Nov 2026 21:24:48 -0500
Message-ID: <20261107022453.159341-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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

The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
compatible for it, with the same data as SDM845 except for the LCX power
domain.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index f37b77ae187e..57a111a0d75e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1122,6 +1122,21 @@ static const struct qcom_pas_data sa8775p_adsp_resource = {
 	.ssctl_id = 0x14,
 };
 
+static const struct qcom_pas_data sdm670_adsp_resource_init = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
 static const struct qcom_pas_data sdm845_adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -2035,6 +2050,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm670_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init },
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
-- 
2.56.0

