Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795561306;
	b=AVkvWJPuiGORrwf42UEryvuWqlzhrHRsxCvRe6oI0gyI/fjCxXwXyx4CPc6bWh3LiVrg
	 s7/2lcsOigqk5uWyjaEsxuhg6ZMs28STGtArt5Ocr2/InEb0tu3avaqQeLwDU4uJUC+4i
	 EP8qjTp2fwBgFUq+TFZwGErDPtAn5GpE6/rKTMlIXIKPu+LtQksC4LOx+B2HDQZYmtsw+
	 +oBPLU0caMqifk0xGvPnpLruk0urE2kOLkbbapJDPupXf8DsRGNsbsmMNqYmmZRzPvCF6
	 lFhA5nZh/oBIKhl9q+jcFAENWP4tSL0F/rDUc3iQ0R7z61MNUFdoTznhCJo9X8euYHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561306;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MjJ4SojVeg7JoLL1gD5dFYIP6ESfGz8LTQLjj0DPGZw=;
	b=K3XujPd9hszxohx8Zjm0NorLO3K5HglsocD03f+k3Br4loCb0R2gG0phpIt34vTKE2rr
	 yTRA+h2bVSeMMsQm/HmXeaTlqnvTIbmf+DonYKIaRaitLMWkEdA3o/4KuL8qhN1fYCnI7
	 UiuCNLJTplO/mtIITE+e054AxwdICB/V7Qvf8NhPlDYrwaiQBpJG2a2d6pJ5TJKvk/15c
	 asVvdaGjBVIZoModqifOSBX24c34O2fJpu8ZegPSWGT3lBk/iVke+JvTIf/MAG2oLNKtr
	 kIJjulAzD1wBXwGc94XXISVWwMZ1HEyXUNreqkuSY4t/f0SZFDto3yWotuWdMtxi7dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fsmZPvJp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC555606A32D;
	Tue, 24 Nov 2026 23:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fsmZPvJp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795561305;
	b=zPfFtgcV0G3XXJXy8Mt4mgX9iUVoU2579AiO3sv2mP2cE86P6nxl/gkDZYuSf6OP7sn5
	 zq3Qkb4EoCw3gAopoUdSdHuJtVdjevAMJLTUuXCdWMuQvDSbtPiOYlLb5K+jSZepZzUyi
	 +kfPKIyrr6jxyt1dnTDzHq2enny5DrwTrLz6700eAasrNyBLG7SHz9VQGABDBT1mjKLea
	 r3fWQYLo5udewXdf1siagTyQ+ilq92iatvARxrSDCATzH5/GRRs6KPmZClOTRbVzO51eW
	 H7AHZfwg/2hfQdvJFsBnDcePAYbPlPZ5Zl/gnkqMmtXlnLIsyjRB7BhdVOmq5H7wn4w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795561305;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MjJ4SojVeg7JoLL1gD5dFYIP6ESfGz8LTQLjj0DPGZw=;
	b=qMdPPOylM6wC9kSOV/j+3BXaDyJgBECAVY5RjbTaOaSQneCf45cUfDPIfGD1rCsRWs4v
	 m9iC3vMhYyf5UPaevDNdALQdQTZ72KmkGrQZluJPEkHq+/BC09ItdOOfCfuETSOKVFEJW
	 rTA1if5IJ79nSW3rys3N/Mx+ZiC7G1LXHyqQEde/H7bqa09OIDFCXcT7eZMKpjpiklDA2
	 OLsS7erYamcfQXe9wkkolmx/uVO+FXnxwGnb0AK5SboJ7xOpFWfkRJ/RIYjJe5qz9MuNy
	 CBVe6Hac2ibT7NJGhpQbWLhxYrovupR7iyfK237ZUoXMlzm5HiEh3v07eAY22qxHbJQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1250E1F000D8;
	Tue, 24 Nov 2026 23:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795561305;
	bh=MjJ4SojVeg7JoLL1gD5dFYIP6ESfGz8LTQLjj0DPGZw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fsmZPvJpFSgUaUy5fOer/2JYzzYqZL82D9e8PFSQFY8gRgfMUcFLt48Mw3ybmXFps
	 Sq+c0exOaNC1p9W+yFq97v8cKik74uM0rqcaC2Tt08Ni2xCO9ysFmfxgAxwkoilNC6
	 kcCGQ2LyqjQu8SZV0+oCLUj77r7eLJL8kmR/6p0nBz7Y5SQ3ro++Lyo8dbXg3y2+J0
	 Y4lZKdfk7esSLg6rSczFDPSTa6HiUqpk/PFUgDoDLTQ2DU/l6mpwkMKM4L+1/vVkJK
	 6NAPvCSRiXhbU+Rq71OgtMGoCteITz1Q69La8bq/9CKb246WzsQ5Ia1QH97BhfrEUF
	 pvK+TxtbnRd2A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8C32E4CC44;
	Tue, 24 Nov 2026 23:01:35 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 00:01:33 +0100
Subject: [PATCH net-next 1/3] dt-bindings: net: qcom,ipa: add
 qcom,sc8180x-ipa compatible
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
Message-Id: <20261125-qcom-ipa-sc8180x-v1-1-48a889acbe6b@gmail.com>
References: <20261125-qcom-ipa-sc8180x-v1-0-48a889acbe6b@gmail.com>
In-Reply-To: <20261125-qcom-ipa-sc8180x-v1-0-48a889acbe6b@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795561294; l=772;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=Ls4DQl8lIKzCyet1NYkIjpGTEw7VXHTl1yE+bWxb4f0=;
 b=KWHKvkZqphw1nMy/TICAin+TjraOOGX978YjvMJXAO0xffpHOBGGb29n1mRTCSQOoAHeBjNEQ
 wXvxEk3PXJoCdxQ/YD/9kwsKudTqoOP0WtBG7al8lTQetRMg/Qe3GS7
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

Document the Qualcomm SC8180X (IPA v4.1) compatible string in the
Qualcomm IPA binding.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 38e3830..99e5464 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -48,6 +48,7 @@ properties:
           - qcom,msm8998-ipa
           - qcom,sc7180-ipa
           - qcom,sc7280-ipa
+          - qcom,sc8180x-ipa
           - qcom,sdm845-ipa
           - qcom,sdx55-ipa
           - qcom,sdx65-ipa

-- 
2.56.0


