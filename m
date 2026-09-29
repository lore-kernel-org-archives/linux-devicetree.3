Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE5F4EA39D
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673515; cv=none; b=eri63Iz+QKFGDBYJycgOTZ+bI/kMAAjdKaZ/V+s8Teo48mQo9alT/M0uVkUqTrEJv2Qgxmvvhb3K5kwYFCw3b4q/M4C7GNBGXMGE9SMr/kEuObrKMHLqfqp9QiI5L9paBS6WrwAqXyEnrzZ9mvdItcResXM71awjnhTYWTURP1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673515; c=relaxed/simple;
	bh=ri0EKLCo9ykbHgtbxMCU2oFNY7ARzNutsXrI2nPbGwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5KhuREhUA88mFnAm/pJdhuAs+uDbGX9Y4j9y222dx65WhnPnyUOd/6vJSGjRW/M6RwcH4m/qxfBFQo9jmiXQYyGvLMLfpx5XrMdAnm011PAFkHLpYpLHGUb4mPq6FtoU/CHSg98tRGfUXWV1EWCYBRqmfHSnVQsnnWzpEzc0sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=YxbKDebL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="YxbKDebL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so10615505e9.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790673502; x=1791278302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=YxbKDebLMf9eZTpiOvGh4dFrsrKnW9OTmWrR9V8nDE9bxN5kU40FgCsAz3/Ia95TJ+
         7D3lAJ/uDEAya9avTTxjvzoFLeycxHmbuxn4F2b1TudXINUu3wgO1VbEbc/BWBk9Y/qN
         YQ6nFHgslt9HwyOwTxaj5/idh9jD6JQoMSXVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673502; x=1791278302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=DjuiZUjsebuTkL+gV5RiPk4nEyFOOJt2GhGbt0DVjz/ypuUSyAdhpMJ50UhYxZ1rzr
         Ue1i/Zm5lgWq4mzp8DXfTx+BedwKmGUG17GCrOp+VX9+d/sXVG858Acgnb3FcqhKdX++
         WW+wkfTXkKSonzDwrNOeM57GJW0XUI5V/jvjE12mA9LprJ5BZPNADY0/5o8EPsz52VFx
         fTOc7W5MXjZkBLpaWWo7QGKW8L3OK7eT3X6M4lqRJqlLK69VgOqQ22C+rvyex4kkUA+F
         JNKfPbtgXcj5+3meUSoL9bgKosnA6zDoy8w+hNvr7OVOQkafS7/8vO9GNtOy6lyyY8Hr
         lRVA==
X-Gm-Message-State: AFuF++nu+duFcCa1gV9hrWzPTy6F641xaFYyfXJFpIFBd5s+e1e1ch+n
	cAoGUVY1dnYUVb3XLhECcD9AGnz05CEgF4C0DWZXblsB98mObyJ5gpIvtYvecwNLnao=
X-Gm-Gg: AYBFou0+1572fVATmETTovEc0mHWTvK4Nfk0/gMMnQZ1gxTNrXPFWPxU/r3g1cXVE7M
	wF/uYsCqbHSZnhSRqFxP0ltTihNIOa4pJH8I6bqF8oHVzaY/aMRlVQK+QDYa0bYIPEmeuyCVgI3
	OhYzxqdq7TVuSSfxJaTU79pzJ2LTYI8HVXRdSe3zVHbwnP1J9vXSWTm6ACT1ayU7ao69Uyl+ZPa
	CloO2lDv7QmriS5WaGw0fVstOrROTeoJCgf/eT9uT5DhxkZ3je6ltm2/mtf+HGgY9GQqPcSkDSA
	xH9+coXCZRenmlBFO9PDnj5F6vYfvSObo1hLHAFxY5Gcsk37lrnWeCwHQW4t8J2OUDRGJyDCL0B
	JzAuElrsWTG1K14lG+knAq0x4hykZcsuFz/IS5W3anrk9GOQdKuEyGPf3OdMnkacstqlKvhWXYq
	lJpyTJ2LlN2bZ45aBKgxv/S/71VdluKZIDZV9Ul5hmNxj8HeEOBdPk7DXA+k/RrPa+TEsYYFdFg
	VRO9QWaRS5PnNQ=
X-Received: by 2002:a05:600c:348e:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-49ff06b2ef6mr212016085e9.5.1790673502310;
        Tue, 29 Sep 2026 02:18:22 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b150sm59178575e9.7.2026.09.29.02.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:18:21 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Tue, 29 Sep 2026 12:18:09 +0300
Message-ID: <20260929091811.3735201-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929091811.3735201-1-petko.manolov@konsulko.com>
References: <20260929091811.3735201-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3

