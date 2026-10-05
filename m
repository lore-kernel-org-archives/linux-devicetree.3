Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F214570FD
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 09:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193109; cv=none; b=ugSgdW36hlHKBIrCnO3PHWnC1JEVVxAOlP2XSD1hDwYu0nlOjoyOqMiyJw+NSBOlz0PAvLOB8EnVdO5LKj/F9hY3owqxTIjHpveeuKLRoAfoWFwB04qe3qrofuogJSxTfoQY/sSZoPJipck/K2CW1if5R7HMsXA0/mZht1IZv1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193109; c=relaxed/simple;
	bh=deANKfbzeo8P+6mjFcg+WjVuDRCAY429YUB2BPT3dak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gLER+chX+MJvhwddEAmh58IE+1EaxEo+Z4RVrzexwAMOf29wg9k8QU2glkAlxMEwBnNjfwVdYjVAX40GKrBeE3DJD0FvBmnsvwq2R3CESHEzbSKJFNStBJsbLCDYsHhWqwwoxf841x9yhQJQbdgcife0qRRQ6Fbh6JmNN4jyUfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6/91KFA; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6/91KFA"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4bbc51755so102286a91.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 02:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193094; x=1791797894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffwk9zd7Q1dFpAeiEuMaDR3BIsGTNaq+nzEVxlzFSrI=;
        b=U6/91KFATqqcw0uduyOpZLa3zHei86eJD9VDl6c3yjm6/FpRNxAImkzFVNGKHmRjV8
         DAl3rRu3WG62aO5faXkxJ72D/YM0fJwCPZf/W8wgFVS41buQwoGimweGjVqLAraiCzB7
         R38tPk+DtGgtmgy0ttppYP9qkj37Tg7k6ZIs+Soy1G+JfhgPudduHCxSQlkvQngcNUCf
         oP2bnIag7SQlgu/Xa2d40zAPb0VHQo+pnkDaUUTfxLDKRhuQiCo/+xmHwG7vqGqXatL0
         iFXSfZs+OgpkL1O4fRUuu1g/g10Xlh9BPuGSdGmZYf/wgW3G3tEAg+osifNHVHOMHJlz
         i41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193094; x=1791797894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ffwk9zd7Q1dFpAeiEuMaDR3BIsGTNaq+nzEVxlzFSrI=;
        b=BBUXIGoJXNKfJtHigDcz1P4Eb6cmik69ehXsd+1ztF/+FKy4XW9FYEZwgC2SasMRaN
         16+UX65V1uJjXLZkADUEWLsAtsVBoS/vKfWbu7UEWavTJmZFWGsxvpynCipumQQXfVVP
         Y/fIJSlAQqJPqEI2gDme+VZKJMv/VjDp/YIsYSSKJUrwQjE/ziJuGkLOkVV9vp3xxU/2
         weKiqZS/5/xfVNREeZXVdwqjN17+LaMkJMCFm4emPIzOpJg7blxKcqC0csoJLgHjrWjS
         SGrg2QYZP84/85zFP9iA9o25uGrG3QIzHUpdUaFH1z+q3jrPWqx1d0sc6vmWRj76GCZ0
         Ke3A==
X-Forwarded-Encrypted: i=1; AKwUvBx+/3SQwNLC3Fz4nkMsJEhnqeczVckraewvARRtGl46BmvyZj4IBkTslPMVIUF3HvIwrAh6V623579Q@vger.kernel.org
X-Gm-Message-State: AFq9FYJl5Qh+VD8c/eE9D/iG1nfcdmWltIYy96GDEcPoo58102LQxnAe
	VHA+4bR98Ssqa3rmlYHfBgSGj2itqfgXA/q3VLWSgXHbNxTKTR52ufaH
X-Gm-Gg: AYBFou2v7lOR7xuSFD5qQeModmz97iZffnKhOaNjLi9+m60gcgU17r5rWPdmuIi9V6J
	6cGGMdIOsJoUSXw3QPGPaQTRaUoUwA0CAG+hoA0/IagGAtfiSr2Z+uwrDT3fIpnxAiBTW05JXfK
	PzOzvjCxSyTvsmdE8ojtQJomrEet6MXgr2pPRYhxcV1Dwlf0VepEgeMOff3E3fAa6d9qyqsHDYu
	+W4iOeoVKPsf7JEr4FWbbnrPpC4u/UcHHKXeV7OknfiYIjF4K9wsPG+uRxREVIqU43awDPF4W3M
	4vNCHzMpr5apOqTCbghnsW1wSt83MzQJJbXRnozFWlYAjavIhIHdDzR2f6+olCWO5+GeU+P+boQ
	5of4c3/ee61HBO1bmKV0CruvLcsKEt3qMRO44tG3vBjIIrAb/67dmi4ack0asfeUBH1jqU5XlrY
	mTmyLFGLxBFWkx89Q3FXEnPinQLNKIEKh69Dsy3SbwHBnZ1EtCzyS2b+D5sjabjB3xXthUMV0nm
	XrLBkNL0E+tUL4E3BZD8pupvY2mpvyylBVMLLa0fpQsBYyFzLWMjfQi7cXtKD2OAkNsPg==
X-Received: by 2002:a17:90b:4c81:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3a6f1d2701amr12943495a91.4.1791193094249;
        Mon, 05 Oct 2026 02:38:14 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e42026fsm10568067a91.3.2026.10.05.02.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:38:13 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
Date: Mon,  5 Oct 2026 17:37:49 +0800
Message-ID: <20261005093749.645014-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005093749.645014-1-chenyou910331@gmail.com>
References: <20261005093749.645014-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal EPHY node is named "phy@0" while its reg property is <1>.
The unit-address should match the first entry of the reg property, but
this is not checked by dtc for MDIO buses. The kernel confirms the PHY
is indeed at address 1:

  eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]

Rename the node to ethernet-phy@1, which also follows the common naming
convention for ethernet PHY nodes.

Fixes: ba1abacc57cb ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Hiago De Franco <hfranco@baylibre.com>
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ec3bf305274a..d2ec70fd515e 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
 				#size-cells = <0>;
 				reg = <0>;
 
-				internal_ephy: phy@0 {
+				internal_ephy: ethernet-phy@1 {
 					compatible = "ethernet-phy-ieee802.3-c22";
 					reg = <1>;
 				};
-- 
2.43.0

