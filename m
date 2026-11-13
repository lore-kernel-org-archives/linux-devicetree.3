Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606291;
	b=ej7VzDgwuWzLHehmQrlogkRj/Hc8F13jQzXAoQabF9b5oG6kqffnEWS+9TzklBKyW/zJ
	 x4H0C0IH/qt3jL1cIjpsVOU+DSbFF8hziK2f3Wi0oo+Ur4DTKJcgE16wTPLLUS5w1GuKs
	 VPZYJvxULeG3Dqzw/9oNhXAIvLbXTsb8GkiRT6hxedLl/gmfIgaPJGUX1/jtOHZa2KCNR
	 dtUejB8rgMnTavH1m1MQwoEOY7odz6R1fNrl9FPgn2toToCmx1Y8F2uybdpzPwbqJwKzO
	 uh/JRN0utHUAFVUo9b2xE0iUKR+CRq1a5/TIl3qcfwEy6oDQkD++bR5hvH1k8VyeDgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
	b=kbFsWsKj/PFAR/ZCzLyd6zAMjp0aAoJlOufFYCafKoqF2o1V7uNCoxh5iIiojbSmKgrU
	 9feCHIadsdoiM6vZc4wF3mDJDN+ioS9oCNc2TEoa5iffXfoUAmZPfXsBS5HA0vEfPscYO
	 v8rzdr1MYad7L+5PZVJ7RLbcCa0hYAMW47tL7B5RThyZGknYgJ1SMtbdA8+hyKWo0qn4b
	 4hLig5MDVadNZxyV5aRmL88WGkfIDtWysjCKTDQjUwlSc0DUnctwRM3J7El43m3QwPMcP
	 fmD/gCpRvHbzgXxO1uv96Fj9OrcfvEt7L//aibRvDJCyakO3n8XCE87AyXx5YDWBm8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nhOwUvm/";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326F6606A88B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 21:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 326F6606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nhOwUvm/
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1364594f8f.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606289; x=1795211089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
        b=nhOwUvm/CbESYpvABc6bNV4x/SqUyA7LVECFI3YGDJDEH0wgu3eha8ut6df2uzN5bw
         o6Nc0gSzp8VX54fSjOyVQDKDWVvSHSHBkbG+EqDg5z6tAnAR3hJYDpe6WYF2PHIJBOzF
         0IL+2SuX6exmoNCwgbQxOKey405yshwiX7lL4A/kmvahqR8mm0pn4YsYlQnSNWDL9x5w
         BixJAAEASN/aPt+VKfmZzBa66+mrG58BGauwdZYjQFQZsCSBjxuOPTOBdxJK4c96Mdnd
         J/sAC9ZChBGA5OQFX6BdJeuEKL+iVapjlX2wXMViNzheJR0P/g8H9W4F0ZNtjvde4TsO
         Y0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606289; x=1795211089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
        b=QwFd5qUsCenAulUH63U2bCjYJl8xurzaclldVaQDv7sggidzPYJPvbhOfoD8RWM37Q
         7U/y7vtLe8yurqPfM4vOynkxiw+coHRo/lF5XQlLvU4QoMTNPGP3ViDX2xrMeWtrL1Ra
         gXfDJQphJM99RZrKMuz9wBsNO5CVcPhy7Ox2EDLV9/vyRXDc3g4iZKgNpn9TJDUsfW3Q
         H4TCZJQk0sfmfTDb27xB29WCofW+i5d5Z1CHT4XVAb0xSIKMKbBrB5tI+trmGDSLGVOK
         wtCYq0yNAOld5cunfIvaGH7e3ryM8LQZt7tauxKUKvbE6vfVYeSLA9T63TdK6/im4FmF
         5AMA==
X-Forwarded-Encrypted: i=1; AL+hErHTT7rTQrI6Ar2k69FTrPavc4ZX3wsWCFXUnsqrfcJOvADzu9Fu8VBSiGsG+0fF/nPMQbH1nop/SXIJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+wUvSq17C1Y5QUxcfUtSCre8jdJNNFk56iKASR+4NUPA88OAc7
	K9qCENlUVvZxivN8zLVUYkfTGUbdiFkM+Wjj2f6GSdZOT05R3HAn2L6g
X-Gm-Gg: AYBFou0/tHo/zkq+Xq0aBPzQO+iix7uk0Vd+XtYX/eSyikxifb0sw0NmG0NQXYFCpeq
	oRYjF3Puv9TTUY9ZdpTKoXnZM0CGJDE+R70e++lcNkMJOeoyq0b3ifIuk/8lfeDpOJIm8XNRpqO
	6cn4mdMwLmzWzPBec+P5go6bSA4+iDxL8CoborhSuJE+wev8+GCRaCKq2opREfHnNPZmKwIMW1H
	LoSDr2SzUTouzZyEI6E+2mc3z2NbfeU0wlAsdxKyAVdUUenSdoAjnpxsYW6eWSXYNtzS/gLs3Dr
	6hiQK5aNdcod1GVNIZIpcuIelDdP9TG8csfkkmT+wBN8E9bjmwb0w/PQBWR5kVTaEgsNB8MqWK0
	RV26Ifwc+k6m+ogHPpXrZIu2nwQ8piMp3sanojSgUN/tWaiqpGX9RJQrWjg9Ddi9Cuyj/7RuBu0
	WExHl9mByVaI2/6fgJP3WcLKw0ZszTEQYlUzVaiBISOBKuB1A7M4by3bKAZfBU5UgKV+WjYn2ez
	UumX1mzgmyZIKfCHz8mcyANj+23x2cGMrKA8CYwnNOMQndEEFIUCSJGgZ/90sR/gz8lOauF7mFg
	H4eMvfi2KV+b4xJrdk6lINYQdf9kevhANGLSR6uOoz+ivHZZQapBYbqyZchI6IjpvAJ4DY4=
X-Received: by 2002:a5d:64c9:0:b0:48f:ead0:631a with SMTP id ffacd0b85a97d-49c72ba5d3emr8894959f8f.47.1794606289387;
        Fri, 13 Nov 2026 13:44:49 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm11644595f8f.7.2026.11.13.13.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:44:49 -0800 (PST)
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
Subject: [PATCH 1/2] dt-bindings: arm: qcom: add ASUS Vivobook S16 S3607QA
Date: Fri, 13 Nov 2026 22:43:40 +0100
Message-ID: <20261113214424.220241-2-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113214424.220241-1-ingo.kubbilun@gmail.com>
References: <20261113214424.220241-1-ingo.kubbilun@gmail.com>
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

Document the ASUS Vivobook S 16 S3607QA, a laptop based on the
Snapdragon X X1-26-100 (X1P42100, Purwa).

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..2390568de805 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1350,6 +1350,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15-x1p4
+              - asus,vivobook-s16-s3607qa
               - hp,omnibook-x14-fe1
               - lenovo,thinkbook-16
               - qcom,x1p42100-crd
-- 
2.47.3

