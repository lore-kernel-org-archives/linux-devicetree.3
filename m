Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606278;
	b=QZ+szbDlJjJpJIKE7aMbpLQRlJc1ziSAaxUF9/9DOq5QOLVaC5wzzkHRMO6ze6+pxyrk
	 T7ohmw/2Wnm0PI+ftUDINvdQDPDhYu4aSRkZUBbJo0GoQ+9HYSz5Lu3XSvI9NSbPdygSe
	 N3bYMcQEtyskhiZQvz9/g0sQQ6yc38gipvoSiWjJLEnHAUOeWej60wS+5OxAlj0AJURhq
	 1V4fHFGSKFVg4p/d+VK2qC5Wu9g1BeeQodJ80K8KwVQv01Q+dVuj0inBpSz9OhTedvaRj
	 I2v0NuQelGum0QyuxrDAyihBTCox3Jm404Go11m0DV0U2ZiCuCQErsRBwJIPKS8nOBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=idHWYPumru9E8eUEsbTnG7m5cr0Qeebr13UTD3g+dNk=;
	b=5NVywya7rC0NkcsyAkrj/FKSriAHP8z+mJIzYoTBV97of/oPt3D4thPwHFTwRuAMoaHi
	 D4msfjHxweEvL9IaY6AO2Tb7/rcIZccoDkDs4L9rGFXZHWue1O/6WGFhQpU+RbdQudp/S
	 Q/F72FeyRnttlPXnc9J1iCiOEkOv4dN+hlDFE4rbJTBQco0M+0TzQ9X9acaDB0f+YxrBd
	 /ZgyCTglnlegW+i9IuCd6NjDjhjf7j2d7ehsgJYHYJ8/zFjb9H1U1kfTQE/HFmPfGhd/w
	 3iUl/gFHvmvXQsCy2ZJopc0ZR8Jq1CECnUx7+DsP7rLde8rfFSdQvhuJTSMZF1bvUtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kI/JEfWF";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594E3606A337
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 21:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 594E3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kI/JEfWF
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492690dd5daso1808737f8f.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606276; x=1795211076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=idHWYPumru9E8eUEsbTnG7m5cr0Qeebr13UTD3g+dNk=;
        b=kI/JEfWFxnNd2OdQAFjZk6WGtBuxQ0b2J1AxChRphTz9LtqA+crMd6d/JSq2A4uEvW
         8xEn8XPjVKMiXFOIWmMKfD7MxNh+Bxuqn7hm+udWlxQdIzQXr7ZNCbFOydxEiXQ7F9uc
         zJwHZQR6kplPB0GxYj/ofAShObktk2YAAe8tx0E63/rUUtRWwGhQwJbTifwqsJkfT6IK
         4P9oXauZi3svoArETQAU2dnOgAqvKCFtIGvakO5vosGIW4BIqJp2Fu8WCFu4Z3m//yOX
         KmxHY5pZuciNqybfUReUFYuEiDGadUqgzzIPQVb+O4v1agvHqo28BTQztGYreMzNSdBv
         gNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606276; x=1795211076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idHWYPumru9E8eUEsbTnG7m5cr0Qeebr13UTD3g+dNk=;
        b=xHAhwo3rkgU60kIFpttkp1Rgp3thDWFb4mKHn1vYMO1mU2XpDVZ/Gd6m0JtvPknRA/
         lPV20ajt5l88eEPqJ+8rwu0HRNB4Si06wTqkdJcin92E5YhqMKiCZ+u0be6hvZXYUwmj
         aAxhdcqaTS3N9Dx9d1+qoWeNw+yHjO+SgxhD2vxMzKDNMap+vTDZXMvtMQO+7CIaDdL6
         WFRE/V7/DnXxh2Ficjkkz8bMXu8cRfNhA8nuiIwNyT50sKbM883I0qB1oMqu5Ozyjp8s
         P2+nrEEm8kjf+917PVMeu69gTrFI5YzkjaN+1cXxV6EK18eYE7oYLRSoQUNrpkQBqW8d
         0GHg==
X-Forwarded-Encrypted: i=1; AL+hErHcTKR8CGClaeILzDqPSLGyK+JXI1f4A0OA4jyvuU7LoUXo1t9e8sEGq8lLwspW1IAjIEIdmNimcD/Z@vger.kernel.org
X-Gm-Message-State: APuU4Z9JBMm7eTWvY+1BqITdURefoQX/WdiQqNFR008xa9M4Y50TFwy7
	ICxHGXrbV5BxKdQzy+ZNKM2pzllaFHjIASVqd2meeHpeDDO3Ifhy91vHB7iceMijpIU=
X-Gm-Gg: AYBFou3O5rFoY8jQ24TwS5iWh2Z2vfAjmt8GWff9OkBIjLfpCmmgQPASFMUd6o7oCj8
	IKl4Ex6U/+epEY1G6whIhyN1EqbYvlrXZOCtsOOqS5Osjr41SrYNrK/nt61TYpv7N//cF5T00X2
	yVaSrw3Um1vWmH38CZDqKSJPipFZy6TiDgkp4r628XIXLw6UHAZU0uU7VD/ZhjXwmcAhIG16feU
	PzeemLFvGTcm9JSUgvjO7u4fxFDgr+1QvX60LYBzOHHYnGoKEEBc0dJwjVVphxZfYWNXpLtrexm
	ONJ4r9Y2zti0Py88OKEkE25XeNI8gx2KGsSGq3w4KJbJFwIxe7rrU7SQyvgdoJwfLutV+Mdu0QC
	7u2IgooOI8tnm5IlFtdWzh+eGB1JwbZj0azNMmga4hXuWTDNxNJqbOigjwNkVa2CtoXeyvWfgZU
	OIsMR08dGWCxPqp/2TLeL8neXAunSqiH3jfyQzzs621IwZLOg6Lf4DbJYhGxbW0hn7p00d+DiRl
	dlgeKyrtFBhQ/rma3zbPA3K5ZEML1rKw/Jh4vlMRi5Q6/pJ7l9N9PSRvSdmRhNxEzYjUoJtpH5R
	Zk71GOekhVKrgnUAUbClya4ufiDpKr9jjODILDcmKPUiLwoLyQ==
X-Received: by 2002:a05:6000:993:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-49c6fd932f0mr8024260f8f.12.1794606275654;
        Fri, 13 Nov 2026 13:44:35 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm11644595f8f.7.2026.11.13.13.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:44:35 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add ASUS Vivobook S16 S3607QA
Date: Fri, 13 Nov 2026 22:43:39 +0100
Message-ID: <20261113214424.220241-1-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series adds support for the ASUS Vivobook S 16 S3607QA, a 16" laptop
based on the Snapdragon X X1-26-100 (X1P42100, Purwa) with 16 GB RAM.

The device tree was derived from the Windows ACPI tables (DSDT, PEP) and
the existing X1 laptop device trees (Vivobook S15, Zenbook A14).

Working: eDP panel and backlight, GPU (Adreno X1-45), HDMI, USB-A,
USB-C, NVMe, Wi-Fi/BT (WCN6855 NFA765), keyboard,
touchpad, lid switch, battery, speakers (2x WSA8845), headphone jack
(WCD9385), efivars/RTC via QSEECOM, CPU frequency scaling.

Not enabled yet: video codec (iris; the Windows firmware is rejected) and
the camera.

Note for review: the CPU thermal zones get 90 C passive trips with
cpufreq cooling; the SoC dtsi only has critical trips, and without an
EC fan driver the machine reached its thermal limit under sustained
load.

Tooling: the changes were drafted with an AI coding assistant (Anthropic
Claude) from the Windows ACPI tables, the existing X1 device trees and
boot/test logs, then reviewed, built (dtbs_check clean) and tested on the
device by me. The laptop runs it daily with Linux 7.3.3; this version was
tested with next-20261112 (several cold boots, all hardware listed above,
without clk_ignore_unused/pd_ignore_unused on kernel cmdline).

Related patches sent separately: panel-edp entry for the BOE NE160QDM-NX4
panel, the qcom_scm QSEECOM allowlist entry and an ASoC line-out jack fix.


Ingo A. Kubbilun (2):
  dt-bindings: arm: qcom: add ASUS Vivobook S16 S3607QA
  arm64: dts: qcom: add ASUS Vivobook S16 S3607QA (X1P42100)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/x1p42100-asus-vivobook-s16.dts   | 2137 +++++++++++++++++
 3 files changed, 2139 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s16.dts

-- 
2.47.3

