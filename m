Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B9C4A64C5
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265305; cv=none; b=F4krfiWaCutvd42nbA8iXWlTQIvhrXkEeLeziOkGtrNapDl49fhkbjB3Wo9tvtv+FRVRZtlzuSfArbBjYAKl3U3K3PCFRVb+edb86KCPvoso4Z5D1i7xHm+8CJFD1a77BqVLsAcqW9YUvOfFsTs/pqJR4R64vi8UlEYzrnjcg4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265305; c=relaxed/simple;
	bh=U4AhA6BUfq+SolELH9yCaE3z5oAyAj54BShh4/smobw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TgiS3Fe/zCCNU9yVAs3HhPoqq0Snm9qPceiObLWttx9kqoshDnLgGYVtMTSqfn90BFbKpt8Q1QGSBSg7t1Hi3DThPMlEhnWsNPbn13xYGK4o24LzbN9Muxy/Lg/wner24QQ2JqCRGxsuUX1mKOkzJQ2Pm6MFtvP58WqxCmLLwvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I6eOmBKf; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6eOmBKf"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so1339062f8f.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790265302; x=1790870102; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wtag/akuhNvJA+6vXIkSDjTSuJ4EXyen97JWOA2z3A4=;
        b=I6eOmBKf+K7J5SOaiGbLwo0DaXRc8+u35/4CkUvxbRqHbPn1iw40w6CW/CQOlaIS0N
         ZYvdCXpSFMrFOe4fGT8noG4FikOd88mfnE1w+7t6F8hqKbnrAY+iS0bHPk+qUfNxaihd
         p5Cx+o/JAKDSPOfM2PLZD3S4bLSMrK2N3Q9vru1KNFNgJvE/8SyZ6m8GxUk0LYXKp8ze
         c+UqFjs+GapgfovqgJj89KDG55Jh20UGZgU5SeriHx0tgY2J0RBiyiU8G4hjTWHuG2EY
         8PH9nTGV54ProYI/wxiAxkkqTXVeqqJ6OW4SSQpwxiXnGKGpLyopbIFXucSqIu6krezR
         dRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265302; x=1790870102;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Wtag/akuhNvJA+6vXIkSDjTSuJ4EXyen97JWOA2z3A4=;
        b=ynuZkQ4PdpaGsvQXDxvTbb4Pe/m3zPfVNmOQcTFJ6nMU5NEDL0L6uOK9Y1ccz22XKg
         +8ZlQbW2hVXMWqwNmXHqeh8S44LSrTPi5tmTRJZg+CIPa9LfQSP76TFhwra6mgCWxesB
         a/6TlCAARoyKRikl1QPH6DzMWfSXrD9Y2z3A0754BHJqZL0DaHehC05hz0oG3ss/PF+U
         2xNsYnUJx0M6WYCEMqk0nyTBZXDfHNhhzVibXNfsz9vtP6fLdFtmpK0MOWbZk6sL51Jx
         DIbpI6Y+QExZaiGTH1LiZpOkLPqEJgnUBacKK/Ta/fElh0qPMFRTkjOdxr3c3FfnvGYZ
         Zw9g==
X-Forwarded-Encrypted: i=1; AKwUvBxJ+3z3onb/ndEZosS4utFapwcrgiqQGFcUh9SZE134jKOkXOpgx15WOuo3FGoFv666jn8W583yICop@vger.kernel.org
X-Gm-Message-State: AFuF++k76BiehFt8EQB3N2W96v33qqkiO9CuWB6EHW2dPBpTh4Zv5Dsa
	4nxTrHDz4nRj9H0VKLOabQbh7M7UqcUjdqpExKU3DUozG26pBNDNMmSwN0DoBcLm+h4=
X-Gm-Gg: AYBFou0Fq8F4vDXyh7IgkowYmnNIePsEwK2aIIxZGAA4HW7J87M/zQrM0vqn1cr4yjc
	JDzZPJH2QQtJgW01pZbdcXneHHS/FHzbNmZ7ce3LQEIv9vjm+uuw8e+A9qu50BYPbI47dgP9wwn
	v4eDAaMMIV4vQ5YnQkOaeEpsBi4nZbi5oTW/sHGExZyWwl8TCwYv8K4JIPw7sITRs2vINKFZJAn
	6WTkYmfZv6OP243Ts6p6Lo/Sg3HLjtUlhHonymiElg3YMVLDjNxvMtBL7nAVSWhipf8qYfkbKng
	np3f74eKyb+SEx7d0R51PYNhbiu8D/H35px83/CBPnzWaaz+3eTUxRPjQ249qbbvTeOzzq9c3XA
	mFOYpqg0WDxaCZurSNIv+pYWb+RsNypvg+zT/JhyriOXRuDxwK1R647ea5cnbnh8CuRCoiCj44h
	jR83Nb/OjURt5ZBUeV+LzaknMRWKmtoeVrM4uaW3hwH6cygzqo8mDULE0WTPVxMBLOfYOXcC7Jt
	K97gnhBWanQVk8t+bso
X-Received: by 2002:a05:6000:41ef:b0:487:72f:fb41 with SMTP id ffacd0b85a97d-4887169fe48mr4664434f8f.39.1790265301644;
        Thu, 24 Sep 2026 08:55:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm4944f8f.12.2026.09.24.08.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:55:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 24 Sep 2026 17:54:59 +0200
Subject: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: add chassis-type
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-topic-sm8650-deckard-chassis-type-v1-1-a58729799bb4@linaro.org>
X-B4-Tracking: v=1; b=H4sIANJHtWoC/yXNQQ6CMBCF4auQWTtJqUCrVyEuSjvqaISmU42Gc
 HcKLr/k5X8zCCUmgXM1Q6IPC09jQX2owN/deCPkUAxa6U6ddIN5iuxRXrZrFQbyT5cClqkIC+Z
 fJDT6aO3QGkO1g9KJia783T/6y9/yHh7k8xaGZVkBhx6S3IUAAAA=
X-Change-ID: 20260924-topic-sm8650-deckard-chassis-type-72388b577e1a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=U4AhA6BUfq+SolELH9yCaE3z5oAyAj54BShh4/smobw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqtUfUx+Xz5WQJ6kj7ORV41bi8ykRzO9zdrviD7nzE
 dF6QWQWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarVH1AAKCRB33NvayMhJ0UtjD/
 4ptyU7LFqGjImapTtmhRn2HpLTVpCNIS85AfPPhUPqdFzl3DhyY/MXIt2jAN/ofE9zmVmFsSzg+Ikc
 n/YCVezeMcORoW7MoGQDILUMUkhhb0tfMPC2jNi+P0V9ebhZWKOVvFYDZIz0OLCPGoGOT0sIfhlm+F
 Gc51o2luLuGxyyoy1TUR3JvH6+LkvcfOQFxCTlyXxXsobvZ0HH2wafCuOtjc/4+c/8lf+m3noecUdo
 2N5Zd6U34Mv++hICeogtODqPbNOr21TTyQO98/XHAkj8FXgTnZ4gwaqcspC1ulwIfJbqvdMcJ4br8J
 0FIg1vfUvtj9Kj23VUnR/gs7DHfBo+xKLyDPzWTpvxGdHlAqoFx+gyVQE90y7Dbh+wOX3PxS2BWM12
 uFvmDz3Wl9UPMrfe4Vj8BFNW8QGuxml5JuXi7onpAajy3LjlqhxV/j4tgAUlL+RBuPZPEuwKVuPUXy
 HEpyj6HBuFkodWZnWi4V03FwJq6ez0tQyNY5EhMik1yzP968jS8ERioqzlWrsVPYpeMhCMQG1UWeEI
 +EiJTMv6xzfaKE95KcL9gLav57GbTZYLiFBCiHdMe6D8PWD0b0wQgmD0k3M8sY3o+IyKGwk/MNO3bc
 +udnMmcWWEdfgXR48+as/8zQBLCt9VbDzH6RWeyV/LRkNTJOeSUcQ7X7EiPg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Set the chassis-type property to "headset" following acceptance in
the Device Tree specification [1] and dt-schema meta-schema [2].

[1] https://github.com/devicetree-org/devicetree-specification/pull/87
[2] https://github.com/devicetree-org/dt-schema/pull/211

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index d25a09e162dd..1671f884a65d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -41,6 +41,7 @@
 / {
 	model = "Valve Deckard";
 	compatible = "valve,deckard", "qcom,sm8650";
+	chassis-type = "headset";
 
 	aliases {
 		serial0 = &uart15;

---
base-commit: eaaaf4a2a53d04da85e4ed13e7c822d00aa2a54b
change-id: 20260924-topic-sm8650-deckard-chassis-type-72388b577e1a

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

