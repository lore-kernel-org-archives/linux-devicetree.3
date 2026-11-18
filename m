Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.203.77.234
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998292;
	b=f2VARdEPfMRrtk6KyAy6ENgvu6wBEjBlAUF86lVBijna25WumsAjR8b/FrB/JuyF2+7G
	 B+rTAXcK122kH8lzy9tuqqmzKTVeN/GCe+hwZtjyNNPQ9/bge6EGysBdWo/R+k/WHsGrF
	 yax2VPEh1dE9QPSbS3yLA+1+dbR1pNPKP3ypV8JVqY5ExXrb7oRzGoiRIfBbrOhH0aTzB
	 E7dEiGSN8iXi0LqjuV9KfU0Y/k2gXKiUSG6KRc94YJaB3aYbnx6h7HVxWX2ucz9XqbPpJ
	 uQ4Kyqils+FZF8Grkzgg/BGteBV1dnbPviBOYDOwhOWOjdlLAMhJQXOUiiubZJR3eMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998292;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=er5BIVyflTBw/dl8O4AeKo3x5VZC2mUzFVF3Z90Ru84=;
	b=zZvYVguqU1wiwrKioVTA6XSwSiAZO422BLPuQx5RNXSLRfmNas7fqLvEldopP1N+flid
	 5bJQHMFy6/Nt3ALrmJoj+A7AREUIv35pJDllgFUY5di76PG/4BW7X+Zd7dXSLN6qfhoBG
	 CuM7esFUKhSvrcWRJBTbOCLRk3YDADIG8SMsQoDuBoviPwaVeSnALOLzd8lFY1NWYWAfc
	 idvYo8cDzxiVrBsIVRzyW41jtlTnsUJ1XHDQJ0iRPDOcC+Klgw70/qmusXq8CA5D3kaY4
	 zpcIzCI44Z7R3z+EpXPgC15hE/0yew4n/YjyPqEJ3X75z7ik94d0lcjZrPDkeS1myQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fris.de;
	spf=pass smtp.mailfrom=fris.de;
	dkim=pass header.d=fris.de header.i=@fris.de header.a=rsa-sha256 header.s=mail header.b=qJGpuRDi;
	arc=none smtp.remote-ip=116.203.77.234
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516E9606A32F;
	Wed, 18 Nov 2026 10:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 516E9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.a=rsa-sha256 header.s=mail header.b=qJGpuRDi
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1794998283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=er5BIVyflTBw/dl8O4AeKo3x5VZC2mUzFVF3Z90Ru84=;
	b=qJGpuRDiX9gBeQC43GmnsepqhWIRwTMLXdljAbtb/sTB/OmHaCDIybyEUuOlbSUDYL+QIt
	cj8DVBRYlenutZ3D+Gca/5eonUuQO0OqhKr5mJMDTB6pK/BYGnLVzkPG6kPTSKeq0Iv8HV
	7zzgbuGcXb36S7ulq1qoFJbf6ygjqbg0rIoLr05ahxeuMdAjqAKFHNodsD5JPdgKyn+3HT
	ndnqiEdOMVtcyecFeCDSFumCLWiNIH2iifPP8yOIDcnca2SzA60NQDo5Z1fWws4zphhhkm
	tY2qEtpMMXMPSzJ5B9ca8RkYpdLaRRoN1lIcMv4hdJ62GSD5Md3SbsT/ksp2IQ==
Date: Wed, 18 Nov 2026 11:37:39 +0100
Subject: [PATCH net-next 1/4] dt-bindings: net: nxp,netc-blk-ctrl: add
 i.MX952 compatible
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
Message-Id: <20261118-imx952-enetc-v1-1-25721440602e@kontron.de>
References: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
In-Reply-To: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
To: Claudiu Manoil <claudiu.manoil@nxp.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=895;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=vo/Z9PpckDQXfhXy+AKwhEFDXKaJuyt510ocLsCv/0I=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIetvA4fK8Y6fnYxFqrrrrj8RvrNHYd4WCackjqcJd59PE
 mIJq9DsKGVhEONikBVTZJHit3htaxbrI3+sOgpmDisTyBAGLk4BmMjkzYwM7RMUxWfOnrLonOHV
 9/pWjoZGbqfsv3SuC9ju8Gvfom9bUhj+mbDe9Sn9JNLa2v65LLt2PrOI/8KFexc67OcRtTvF/dO
 LAwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The NETC on i.MX952 has the same IERB, PRB and NETCMIX register blocks
as on i.MX95, but a different set of ENETC instances and a different
NETCMIX link configuration. Add a dedicated compatible string for it.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml b/Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
index deea4fd73d767..c443fe0b4693f 100644
--- a/Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
@@ -23,6 +23,7 @@ properties:
     enum:
       - nxp,imx94-netc-blk-ctrl
       - nxp,imx95-netc-blk-ctrl
+      - nxp,imx952-netc-blk-ctrl
 
   reg:
     maxItems: 3

-- 
2.56.0

