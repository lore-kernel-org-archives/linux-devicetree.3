Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BB3413229
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985959; cv=none; b=Hy3Pf4ik6303HgZLmUI5MKrZQRYi1gPpHSNe5f8ZXDPNzLMzWsQG/wEAAsZyoTk/owODB5bq1B478ua4wNKdLKTZWXzSe/4XPU8PZvbCkPvulJN2bTPgrxj5D/rDeEijogpWi2sC+n/OGcam9sM8ou3AS1Ndk/us84A+5xxzZKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985959; c=relaxed/simple;
	bh=lR1IVDRMJkZXoDslp4/dph1T2GakLoRbrBddRQrqVXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgIJ5X5OAvMi8pnk/H6NMKLjpljdZjG0gvqVa/3vdDwZeGX+7iONspJcvErjpZ7v+2SBnD7HHtySztc3vsn3JT791q+YWM+CUd+u/Yrien07hDWY6lWPRHsRVWlw9z1Wd4ivaPMcQtJOQNeKb09H/+Kskuy4+Vc+RAlqMWtvOec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YarCvP1g; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YarCvP1g"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-506251815a3so51288011cf.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985957; x=1775590757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnPc8TBTfWgiuHY5fV7Z5G19bPt1vmYlz98f9MexdKc=;
        b=YarCvP1gUlFmVvf2hCDW3A0c6+Yqx3WeGnh//2eJbIqaLH/lgArtmXpeuVU5hNE7mJ
         gCmjvri4hhhroIuOta3NgC1/DcOyxiIzDJsx3gj+Q/RB8d6am8hFfUDz73218N8ddHNp
         6f0MRemboY+gLHfrCHcjiC854qzJKU3QPl4uG110QJCWlkwhK3x1/XaLRo/8h87WOZ70
         s8raU1WLINH33vUHuZj9xqKE5ytGE6GSDrfKzv7W7gvSFUs3u6ZLaxej0Ui4HdwmGQIo
         v6oAmbOFDKSV2OBHoRz1di2YoQ/s3z3gCFYtCI3yajHALyN3BG8OmZffDOt4UiB4hEwE
         pPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985957; x=1775590757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wnPc8TBTfWgiuHY5fV7Z5G19bPt1vmYlz98f9MexdKc=;
        b=J6R8XCBVPEFT9V6Emv+rXlMApVnPpnl6MiTocTAedmQDgsBhrj3XFxvjIIDgL75n83
         YZQyqsJvvLiec5pLs0QKPaoxH6YYOMZH+B3h3ix4xpId+nrGIgs5+X/6BUwhFfwDZt+z
         T93ayot3VzNoJTMnFxTtBHUjmrVlurVewGRmUc3QoZmxqFaB8Wp9spQJ6ZhsUkI4HkT6
         +Fa9VBe7xr++ALb286YLfzv3zHX2WPwjIDxEDuMyZySIX5a7fe8/eGWNuuz2KFldh2KJ
         bZMFzicglexC8M5QcIoN3jItQoPitRFPAYZ98/FICyaYMViWkVmXs7xme62ZWL3wGRHg
         5Gcg==
X-Forwarded-Encrypted: i=1; AJvYcCW65e8D9erqLxLqqjzbKne9FCcKq3cD3ZNcOaIHATZlvR3CJaBzlsSoHdqc6zILD7mzajGKUeuo7Rpy@vger.kernel.org
X-Gm-Message-State: AOJu0YzVsZaUoi6jMPVWa88eK3rwhsCL+LzUODGrKN52vtpFnd8mNldH
	TCyOqStX8foySLsW4xB9mjKflShF3M7u1K1y3Sfc9vZ4TljQgAzpFJu9
X-Gm-Gg: ATEYQzxmINsfGwRh9z1uYgn6dzdPMMI1KWvdy2qc9ZzQXjdIGoTX7HUZpVOkLv/G9qp
	KzXB5AZJnMUnCvhfK65n/3DUqQWJy0ZYvX/5CSvemWShZezfDvhmWWoK/UsypEUm/A+FFHLe4KF
	Qeqcgm/Z5diw2vUIjOwHlqDW5Hp50/upQqp7dna2tH9pHiP5nimATxbngbNVVTqYAP+v6eU/6Lc
	wSB8K75JDYL7CXL33UBQkR0NPoT5HKdVeTeme39u75yhdhEZs4pWJHb+Sd3iznqxG+IOiLm0IQF
	AknyADriUlh/uWbAOMCY32fWBtf6D353CKpgJP9nFBklo/H+jNwY4/KTew/oJArrg5UTgP3bAOO
	nsOlXniEfJm5q0EMHlCAIaoToHSactnDC25U/IJVCRHoi4yXOkb0R9QSKzw4vSCtgQToqPISryC
	c1zPmpnDQqZ8dMapL/0DcU7Ilv
X-Received: by 2002:a05:622a:4c84:b0:50b:54e8:39a3 with SMTP id d75a77b69052e-50d3bb92d1emr11419271cf.2.1774985957355;
        Tue, 31 Mar 2026 12:39:17 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bcb86b9c6sm83566501cf.9.2026.03.31.12.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:16 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 05/15] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Tue, 31 Mar 2026 15:39:29 -0400
Message-ID: <20260331193939.40636-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSM8916 digital codec is also found on SDM660, typically connected to
the SDM660 internal sound card. Provide a space
for specific compatibles and add the compatible for SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
index a899c4e7c1c9..33bc23b6176a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,msm8916-wcd-digital-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sdm660-wcd-digital-codec
+          - const: qcom,msm8916-wcd-digital-codec
+
+      - const: qcom,msm8916-wcd-digital-codec
 
   reg:
     maxItems: 1
-- 
2.53.0

