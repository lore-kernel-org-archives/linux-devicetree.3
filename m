Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D8E48595F
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962590; cv=none; b=Xl/GPCI1zo2LZYRHzHjCFqGrEj59kKtJvZ449pfYrgxyA901OagGjoIQrymxhcPK+dHWm/ZgNc9rgByU7RpQRTk0nN+hSHX+YFGRJuyV/CzblATpB9OSGH99CpiTWD/Hf4zDZay7tkNV0ofQailLcfgoOWAgSm2ygVSXdWidi9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962590; c=relaxed/simple;
	bh=bClARkP3Hs4Gxz7luBgLwLm/lw+NPl5INSd06yJOZNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJocoY5zyGqsK7bfF3VzSCI7UvXNbLLTlocwaeOAD924z/e4AgpeEiD4hxIpmXw5Lm3o/wNIrMu4SXVKWU72VRfcab+IDCnx0ofTDfAvwaiRXbtlGBIGeO36rZIu7CzvmQWrci3jaA49UFan7NiObSVczq6qvEKyneGD618Au2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ru2/2ncR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ru2/2ncR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c14a06c95so2919233f8f.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962581; x=1792567381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fpPs3I9x88FPkLwyMiDotfchIunSLV8Gp3fGeRLE/I=;
        b=Ru2/2ncRDqm8VYUFjiRgDEP7f3IUC9NGihKw8UqrRsZ2yzLYxT+Dgdw7sAcME5ZbRh
         TGkeuCI1z10De7yxKE2T3FUAO3S8ytkaRjVDF06a4Anyq1riQUEvVjrw0SwUNfBCAZz8
         LbwbI+zSadlkt29MmI7esZHctrWjtHHOzZxwItyvcead1puKJ9Bg+0lj4Yz1So3+Xep8
         mJXw3StQY7A3IE7V+C7zmwpc//GbgVx77RRb6CJdh+uchdCoEGeSHm1oaC24A6qGa0gi
         hcEP9qu3rK7ud3IU+uAig75YUgiZTQFoQPleFXHpFZSZM+GN54sA8iSOpy9LJzIe4z8v
         bZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962581; x=1792567381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fpPs3I9x88FPkLwyMiDotfchIunSLV8Gp3fGeRLE/I=;
        b=EI6Cy/oXgtgjsFBrpcED0DCkYX7rEzMB47UFMDVhWCUERar4Otgq4XVe+w6RS8eOax
         zIFO6XG4/6Q+q5jS+vLNBS5PHueT/TRkUzwcsz97wkMaUIeWdaWGrnemSiEhgBsTQgCj
         e5km87rTg7ojNoOVQWXsByVbcpxSILsrDLEMfWN0rZxyog/SR7mO2MItot2giniNCuMx
         lES6dwhqA6iLi46WWzdm/Lrh/DugG6aXSFYAWUxwH3tip3YDW7bE31ELTAIZTAGI9BBb
         c2/1Tlm8F83DAEKvl29i/zO1r8QnsiQVqSdJxXzapbFUFoGcFd4zk1k8mbI2JhEmKBru
         DV2w==
X-Forwarded-Encrypted: i=1; AKwUvBxTDPdF07eCJg/vcnL2nDylHGTiwbaywBXQ5ZAEtn6o/rPKn2DiXIoaA7N/UaC2GKk08dZ6D54vzii8@vger.kernel.org
X-Gm-Message-State: AFq9FYImcJb93Qn+9z185PW2pc3+eGrm9mVrm5mZeSzbhwF4IaSReKgp
	KNEzCsJgpxg1rxuJ3dcMWCvAuTf3lpMVgvZaKrjBipz3ZAI9ZpjltsXJ
X-Gm-Gg: AYBFou1z+w4pHCUM/8Tl+fB8Ez8EAIRGCSxj5xUW9Swgloeslj6YLAfiwqojyDHzmnb
	LwcMen2EwmmMT9WkiD2swQDsMJ65vKHmbrq7oFXUkcTNJmYzXiKvKrhklZJBWYOh0wFO6+Og1m7
	mV1uMD+myBX6IJFsBl7ww/plYiMNcT3tK2m8ajSgbLK55sVJ/sucM7HWDFJEhP1A10rYcmDGM8W
	VBAwPXDqRPeiK0JoXrPn1Ba2/eF3pklka6wc47mVUDIovNpt1DmXT/nJaopHnRk0ybhJvJ83epb
	kVO9N+PzZFmGgJQv9dBNA2DmGRd5R2uP2RVnBJYiOmJc5wNz3YV4xEvIP0zRFuhioumhjYcYgei
	ZCwY2NEMtg2YFXOX29Uy5isSNhwbF3dEBH8qeDc/v03Gu4x32gR2kdJct5ODPny1Rxgwl6dKbyJ
	1DK2GeR080FXgHmdIUtkI1srS1KqGYOlBEU4oaweduSrQYJ2g3gpkgFDJouCb2O100Y5LeptjbF
	LlTqRja3lwUj/XaZDPfq8ZX4+T4cfKx8abijWfv9PKWF2wTHq2hpFj4s1rKTeStCR51nwKAzR8s
	5McTPK2EHf/VN77dMrpHhl6X38oJqbTU2WoOYF259WvjPT3oYijSWC3pufezFA==
X-Received: by 2002:a05:6000:4b05:b0:48b:60d:2b28 with SMTP id ffacd0b85a97d-48dbacdd339mr26410465f8f.39.1791962581434;
        Wed, 14 Oct 2026 00:23:01 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:59 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/24] dt-bindings: pinctrl: pinctrl-single: Add ZTE ZX279128S pin mux
Date: Wed, 14 Oct 2026 08:20:49 +0100
Message-ID: <20261014072109.1759502-10-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pinctrl-single for the verified PCIe and external-PHY bit selections
without guessing the unverified field layout.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index afe7329a1d..bd57b41f1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -33,6 +33,7 @@ properties:
               - ti,omap4-padconf
               - ti,omap5-padconf
               - ti,j7200-padconf
+              - zte,zx279128s-pinmux
           - const: pinctrl-single
       - items:
           - enum:
-- 
2.55.0

