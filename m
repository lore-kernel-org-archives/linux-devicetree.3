Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557802;
	b=MFBM+t4Q3vAARA5leEEuGiEsEGuQnRrlG1YzKMoVB9YDIpKsHpGTY44g1A9mX9IzBFv4
	 EPoO97vZlZaSzsHnoAXjrquhjOYf7eQat2Uhhm2itCpasfyTUBleWIP+2WQJkpJqIP1R7
	 yBCCO6P7nZGtbm5xwTGefr7KiFb+qJs53bJL1/V5oTXCalEfa9B6/lut8nbmign09TlGC
	 u8oQWTfP1LDhcIcDSyFKLUExFG6zotTJ2P2QICXKTLo+s7ZZkDSlMv0NI+tc0slsXohQB
	 VFnPnwQ3A4fwagJ6+K0BqA4jbJAcMuAk8Bquz/0MCLWPGewNyDb/pLh7miKL4Dvy3Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xteIZdPAt29TQvnBYpNhyztO/+db/w+uWq4mUr1II3s=;
	b=IaQBdc+vxcac21fjqmZgbcNG63e3xjzYPVAy/hhHKSxh9UGcnbpqrcRCRDOULPIDkJsR
	 i1tSsR2kiKI92Ttn7KnQAea/CacGshoLtFa4nQmRZf8pbMXVVfIairiDpplsGhKoGI3rR
	 QF3vJPK0lnBGRBXu6R/QN3uSz9v6vz4jTE29E8sbVYpJ35jkynnXb9jwYRSx7Ys/07uky
	 8RyoRvwIxwYQO45tJHyHlTodd8H5XjXKc74q1JnwyH9ov1BGrl7JrW3rrFyM7HYtdiSaM
	 RATOznLveHHK9ad8nHlotCcSQ0B1Hdmx3z1kr0v+Bxnev/T2Dvz/MPuVXRFCiGrhjsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=M+i9Sqh6;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8C5606A898
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA8C5606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=M+i9Sqh6
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c45551fa84eso156122666b.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557800; x=1795162600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xteIZdPAt29TQvnBYpNhyztO/+db/w+uWq4mUr1II3s=;
        b=M+i9Sqh65cBeC99GKRtTsjvKA9eNz0Ojf3HZlQQLVFkDeHuf2fyP7xQj7nwPBTorfr
         BxtJD1FlwF/J63TjhMSp0XKAlMq78yP9xnYAcjtnPaEou3Uz/4gxonmqi0QIAhlN7rlE
         Z/VoHH1aID9T9UZ04qrXheKbcAfkDMeAecv5xTFBBXgVWfjjY8yCBXYQGJvStlQiFiN1
         rQlL0C5I9R5Eq8iz+D8sb7u0+fINDGe8S/Adw4/w7fLuHcO2P10u/9CAFCPL4F2SSR5l
         vidkkaVmfhAftFhuOKgymjFj3RQvbGRDE9shADZLkTh3i68BX4NFKjwYdKBK5rHZ+REe
         lQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557800; x=1795162600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xteIZdPAt29TQvnBYpNhyztO/+db/w+uWq4mUr1II3s=;
        b=gIwXOTog6q294tw+NnY+bgZhLGeQGv7LuLMXDyW5ZT+MRMnC1K7yji12rSggz5ZJez
         V7mzMcqgOquGA2MxI91Ar+HSbKx10WJhcV2apgTwxpzs4O3qfaYf8gg3PM/ygeAJ0uyV
         5snzKdzd2Nx1YSPdl/sATScEQoWG5A95/P7e/Clv+McJlBsR37Jtasw42awr2YGvftFH
         uW6aRoswSb/MZ1SS+opLBSET+QrUm/bhRGUjean3lqlaXLxOGt1QxM7aavG3JWN3XERr
         3E7ny5foJqJiCD+c2BvWhztJQV3nCLY0KPg2jw4wM0wAsrnLB98p7K4phVnUTIaLAwRk
         1Lhg==
X-Forwarded-Encrypted: i=1; AL+hErHsUxFEBb9BoXKqsUWz3WdnXwflLN7PycTT2/j/QshXfi72vMWy3KjfKXxVG6zEDLXkYYEF2DCDg1uE@vger.kernel.org
X-Gm-Message-State: APuU4Z//0guLcNt5EiXFUfAchx9chyktSHjA0oALnntcPEeYtHaTVi7t
	mtP33tVVPT44DvAKUDTqQhhGrW+npdMQJ7wDciSfaMqxA4BfE1QX5jORzCS3RmV5HwI=
X-Gm-Gg: AYBFou2Ro7oZnrN8gGT+g+etpG6vaMIqrY2VK/ng+aIRClA0fdap24CS2Siyw7fYVw9
	azlxtGMwtRLH/vDN2NAe3igR2MgqTYb7UrlrtAFcsxmBdKPHmGUOdJzakyHxIp2SmfYmxqTxMSk
	SGUcqs26fpQjFFXXMj+MvSNg4G/Ev5awT1CDyJpRiB42aNUraAN6XsYLGWSXJf3E0HSwiC7miSp
	SQ6KFUR4LrrUaoU5ebNkYGkIMHScorllfttMgmw46/06llrFiOWwcDKt1+kCBB1KulOdzi5QBoX
	rgQXkHjUK+FPV6MuSKIeRbSXWUqS2TmIrgrFbRjN9/Uj5hQy6pSU6EOC9SK7rOl6pymXYQmfgIX
	v09JBDIB8DpQid9ggvxnup15o9p7NvGE3bPgJp4+yrPywEFd9MoCxGxGJsSZHSOsoiuWcLIdV4U
	+yGsrRJmwecar9MwIqs8UkEg/9MCrqeXtEL58Mn1FG4TPTB2jm5gjh9w/zY9W55BrRFKsZ+wEiB
	MooQYst2Q20eyGefWcsXLP9O0sgVaZm3oxo7eMh2G9/yrDSpNXBQOIc8CIW6y1bq5ag+Mcp1aZ4
	ns87uHAnwEfX1NqbIm1ZYSuWeQnvQ9GciqpLyB7aUhxoDjZDHLxPVe3C1HZfvUIdZW6nXd+HumJ
	n1iVRMG8=
X-Received: by 2002:a17:907:3f91:b0:c42:102f:15d7 with SMTP id a640c23a62f3a-c5096398ac9mr127750066b.10.1794557800269;
        Fri, 13 Nov 2026 00:16:40 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:39 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:37 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: pm6150l: add LCDB regulators
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
Message-Id: <20261113-lcdb-enablement-v1-3-1dc40b49ed82@fairphone.com>
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=914;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=jSFr6IDnvz36B8/Z3/vtjUsuHYxlF+1hv1m2I+QA4eY=;
 b=gYNntGCDYW2h8z5NxO9fK4rn5jIALH26kXQ6PcSladSms/2hW6O+tYlHjv3FEYFwHg4rVJ11U
 4WJBHNDkSF5BVgI3WYlq5TENmYxC7hoKB97X5jRUuatY9UMUmgi+enl
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Describe the LCDB block providing the LCD bias rails. Leave empty
regulator nodes, forcing board files to provide correct voltage.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm6150l.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm6150l.dtsi b/arch/arm64/boot/dts/qcom/pm6150l.dtsi
index 334f976f1154..095b24a8a01b 100644
--- a/arch/arm64/boot/dts/qcom/pm6150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6150l.dtsi
@@ -135,5 +135,19 @@ pm6150l_wled: leds@d800 {
 
 			status = "disabled";
 		};
+
+		pm6150l_lcdb: regulator@ec00 {
+			compatible = "qcom,pm6150l-lcdb", "qcom,pm8150l-lcdb";
+			reg = <0xec00>;
+			interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+
+			pm6150l_lcdb_ldo: ldo {
+			};
+
+			pm6150l_lcdb_ncp: ncp {
+			};
+		};
 	};
 };

-- 
2.56.1

