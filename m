Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794945613;
	b=U/Wkw1gVL2TQEMogEZ/Ui21Hwjk8EDV86/5Wah4Pydf+Sh5WhIZOBAu+lLj+AIuyXPMY
	 X/cDQcj1br7GwHaltiwqMEKvQDTZP9kaZIost4VJUmviGr6bhmzckomJ4A5fX+JGJ3QRn
	 0zNnd/F/Auw3sGLAHNsU2zS4grefUVKAjpmRIGYD8sRnRiu0PPxYKNHlwqGkxkDHe3rdA
	 VgvlEdKv8HcLnX4Z5xpm9396UXb9pPZ8WR2IZuRcVxk4I+Lds3Xp2/hNxBZit3eNsv7v/
	 rFcnlCNXg+FGmVCn8/3A9fB1ueCBSWNd6mLg9TSy6/meKBFt60F7lcekbkmPqstSBRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945613;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4LbBB/2g75fJnlM1nVGDOVNBXnNl2+P7T1zrJSjDCkg=;
	b=Fy0tKJSrCdTwO04K3WQW0pOl5ZoJFQaIOzaMOvkO+TxLyNKcquCCLvwphLSm3cvUvumG
	 tQEw12AMe13lk/MUIa22UIAF514ctp8RioYr7a9p8JrQO8K2R+MLgZAkfcLen2mZ8q7AL
	 wLw7UX3kLG1r1sZZChEBY/gggVmFPLxvs5Y+4AD7PjhPLdR4cjcx4VBtjsoHXJUeWwsrM
	 /Y5VqS0GRJbV2i6+oXlIHVl2ytxHjAxaciY23fC9aeQ/eTNQC1I17DadwDw9/tuLZSK7o
	 dSGaaCZAxoCXmVln3ufPhe6Away8WdUw7+JsiZOKhnDZPKu7uMTymzkpZ1dG46trXqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ereGplTk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99314606A330;
	Tue, 17 Nov 2026 20:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ereGplTk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794945613;
	b=ZO44xy3Ng+KHkddPA+tNCak5gKKT46bWJ5okNlOO7+QxLT3dotiKheLvGnpUeIOkrM+3
	 rBmWOPSfvIUertcZ8sIq/lfqqLl+7wgwVLrBhKzwXdijm27VUHStXFxbv9ujdPkTULHwk
	 lyyoxT9evokOezSakB9Fq2oPTtB/evadhQR7649DC8O/xAIjyu9JLwxqeeBzqL7g0C+HO
	 5OHJPAWZsD/x1hzZdVKgjmyjv7vmLpV7RHu4bkHGlnHVxLRXMZu+RfPmA3EKQ9Q3kkFp0
	 +dtMVSETiWZW+ywXLQHp8LNKMB5SHqY3VufisDVqSxoshBSTguNZroQStFn/foI7IDQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794945613;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4LbBB/2g75fJnlM1nVGDOVNBXnNl2+P7T1zrJSjDCkg=;
	b=mdlNLVEEE6+IgMrTJSBKS9Q5TvU9a+ZXk+ALRrA5zLuCu7giSScBxlvkuBV656yCiiTg
	 hTyNKyc5kAobIyfZiG/DpDnBjbAt0dSEi1RkDPSYq44GdVdo1e51ITbkTp2q3O4KwD5Cn
	 rcc6Kmu8nTfe0Hqz1x5j6vBjNYy4RW1+kQDePRGIbzjx/doCUJcJteBSPfUyOeoM0Ly+o
	 32K3JbZplHwUokARcY9KyFNybRD/0F/4ksHceuU6Kz52WmzXABfI6xCIgMCePPdwfvyQf
	 s4J5zXVdipbFUdD5Dfk+jBdsmrIDWR5ghRrFNqeo//AdUXhdUYbhRYh3ivgrCYb9ilw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD3FB1F000C5;
	Tue, 17 Nov 2026 20:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945613;
	bh=4LbBB/2g75fJnlM1nVGDOVNBXnNl2+P7T1zrJSjDCkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ereGplTkSW/Yh33IuesonvJdSrt33lyCl9Gre9IGs7GumrolLfhdWnEa4BZB7jx4F
	 OxA8n7olBku2ZxyqM7H5FSTBcj1Woyqt4o+RKnS67wGacVBM2MHAaclHrfWnjwhYyC
	 tdrYL3EEf6qR6SUAw3iV4XzkbS1buwSGiP/9zNzEmtaoCeM9wIX/hBfU3FlFfGhKlJ
	 S38a3D/nH3fDBTwZk8ZO2jzcA9cs73eH1ONjiBHGfBdAkCwP9tWqHLgvUV4LMl5ICq
	 RLe7dve7Tt4G+/G75NH14omFUc9Zqe8uG14uTuVPEkKZkO5gD2eHCntDCVxjKm+KTM
	 LYyhp5QJXdwzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 443CA4AAB6;
	Tue, 17 Nov 2026 20:00:12 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Wed, 18 Nov 2026 04:00:05 +0800
Subject: [PATCH v2 1/2] dt-bindings: riscv: eswin: Add Milk-V Megrez
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
Message-Id: <20261118-eic7700-megrez-v2-1-0113ebc5b670@iscas.ac.cn>
References: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
In-Reply-To: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
To: Min Lin <linmin@eswincomputing.com>, 
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794945611; l=781;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=yEGqwvhItikCOim9M5s0hyGEeXn8c2umboDlEvC4XcE=;
 b=/0eh6mt7RCm5DEygEVRE4eamr6oWEncaZFrDhtKhfNokI0DADKhv7W1NbthjBnX2e66SW7wIb
 AQXaceinxMjDFk/DpZ/Eo1y/1Ez1V4FNTpwnqD5Lun/zUL+/aWkAuJu
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

Add the compatible for the Milk-V Megrez, a Mini-ITX board based on the
ESWIN EIC7700X SoC.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/riscv/eswin.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/eswin.yaml b/Documentation/devicetree/bindings/riscv/eswin.yaml
index c603c45eef2252e760818e830e9dccdf0fdae6cf..f730f5ff91797d4c2f0610f9024a74611ffeae63 100644
--- a/Documentation/devicetree/bindings/riscv/eswin.yaml
+++ b/Documentation/devicetree/bindings/riscv/eswin.yaml
@@ -21,6 +21,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - milkv,megrez
               - sifive,hifive-premier-p550
           - const: eswin,eic7700
 

-- 
2.47.3


