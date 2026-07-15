Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2623914E2
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125894; cv=none; b=KSEIP24JsysnLlyvH7I9DszQ6XGXbXq0D0Lu0v8WZMgP3cyzHZneBGQMXHUfT105EmlZcepdOsLSSSwY1PPYfRsRhMSJQ1hbbBNX1RZxRDxn1H8X5ww0jEmGl1Pmxeb1IR2Y4Z+KIqTN+C/CzyhWTgqShAgVyQ+nKpUMx5F6iRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125894; c=relaxed/simple;
	bh=JBebJb4jcuu7x0vRBxHn+90SiQlNqxWidAhC89Jq7t8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=BrDOV+yZCwD9PxnlA8PL+SXuwuV2DEguPsTJUo9cvEmPiZxD1xTOfr5Z3LRdKBvOM3+cRlB15TmsbJnA0cHzL6HJGingS++uV8VETaYCq3EyU0YvOmfhgm/PmKisw6yE/8GRAEtlVoi3r4XnnsRa1lDgC97citP3kTPkaBBDipU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=ZypbwYTK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="ZypbwYTK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c7902f47so46617615e9.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784125888; x=1784730688; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/PBmppuhCNxseIU2k0JL0kCPG9sQNuCzK5Mbh3VeYEY=;
        b=ZypbwYTK2Ky1BlDSrM/NiejCWGVA9flQutMHeuCuNZycoiKrv99oq1qnoX2kV9RwHw
         J0nrS6DG6yR7blGBzFnbjzo7OZTLGNRIwKfRjsb8A5/UnttuHwuLpPu0lmCjgF4elMm9
         L2BbjaFdXLwO+lxduSOMDqrfzNu598yskskCYcH5btndmb+re3LgGPO64XhrzTAjeqtq
         pYbWpqHMtdI1KKida3gEPIekHockrATpiqY7C2hgIqffKRNTTNvyxhspoA6aOMKkPdGm
         qcBzzTgj7l6KV0XNbq5khYtNJqKCw6iBbma8/ANoTZ9FDabOpJOUTri79Tpa0sSRMzoZ
         hIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784125888; x=1784730688;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PBmppuhCNxseIU2k0JL0kCPG9sQNuCzK5Mbh3VeYEY=;
        b=iOBusLadCrA2PsBgCPV6t4nDeFqMLWU3MYQ8EMmeq1i8F+EXvPpv6VZq1fJdO0pKqJ
         DG0adlMB4RX4h5GsD1Otuhtfo49MGlSE+rp1/y0nNJtNnvbKJ2jq8zwb+p02HVH/yr6x
         Y66npmd5u7LfOPnE3s3mn+DMDMb7xbRhMArXU2NBnKLVlyVz8A2h9UwhwDBShWtluu7d
         MarPslbt/BVT6Byz4n3leSqs7+dEvEtYMw65zH0fz4GCd6w3yx+bicXSS9Sz3xqUtopl
         iO96bGihQRLiPP+GO+K0Guz+3eQfH89zbb/i3BdrY1VXGnGr8QE9RvRcF6B/4GbVS26R
         plhg==
X-Forwarded-Encrypted: i=1; AHgh+RoKznBJBPgIu5NI79AJm/ALFIQ3roa9w5nRZTFwcWC89/Cbz36EJ6BxfipsTJxsQ4btrYGiWwEEx8jQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwOlpIfBwCFrdopGUqHmkpoZPmzEncWB6dTCYlukQgz0/+/Qbxs
	DHUyayOG6lPc3bCk4jqol7ltDlm1tUwtQWROkMrJXrlnzv5mLuwgdHWSFAL8128nFAlDn1B34bX
	h2y7tWvdJRhCN
X-Gm-Gg: AfdE7cm9hIyMmG/Aku9U+/H9Mbt1rcYanxyEZbGAL9uKWIRc3GpPq5lUnVYheSod7FT
	i86paPz4z2wEVo+BAH1lh4V9h028ZnoHpNwJprZ341rUTwu4DWd8qYGet4T8RTDlyE0NsPVc4ef
	+CpuxOBBhHaXZri4PNTJlvFE3PoxCC4vVde2eqn2dgxXwDU2FCqj32qRXDg2UbjDb4RvXGnszOU
	eM8UVARBzqj8FYgr4jQKKzprXUsPknNiJvikhZ+bZR3nyvjSTxar168CfzP5J5dK6UwmT8dfD+f
	woaR6hdl0lZ94rHPQZSe3fd1yn6qW2B5cZQAHTz275fxSWtWJ3uFiTm3WXDE8AG5yph4ENgyDLa
	oXpndy0EAxuE2qBtPgC/ps/x6N+0JAMtpz4lJpeVSd0Rr5lN/qUHriMj8e92lNxQkW6P8Qf/6UC
	OVPdBqWmqV2VmKwa3MWYlXSMTr33cRVR4FfzM7mR47BDpQdRD6lnJ5zuAOlBtjRpQ0C8Piv6XUO
	h0NAL7Uyfv0Qn/U
X-Received: by 2002:a05:600c:8115:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-4953c14f78dmr32474645e9.2.1784125887641;
        Wed, 15 Jul 2026 07:31:27 -0700 (PDT)
Received: from [192.168.2.28] (p200300cb8704a900f059545e4a985631.dip0.t-ipconnect.de. [2003:cb:8704:a900:f059:545e:4a98:5631])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495087366c0sm280236385e9.7.2026.07.15.07.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:31:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: aspeed-g6: add pcie-lpc and pcie-kcs4
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <de49f2032f5b1f170161dcd6191c0daa48f0b0c2.1784117715.git.gregoire.layet@9elements.com>
References: <de49f2032f5b1f170161dcd6191c0daa48f0b0c2.1784117715.git.gregoire.layet@9elements.com>
Date: Wed, 15 Jul 2026 16:31:23 +0200
Message-Id: <178412588365.243141.16731478852761544781.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125887; l=1599;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=JBebJb4jcuu7x0vRBxHn+90SiQlNqxWidAhC89Jq7t8=;
 b=2EvNZFMIlLmhR89ccAd8ZS4HjM7x2BcXOqQidZyE+xoKd8+yYA0umsKD0IHfhb6FFnA6BrCOH
 UvXNmryk/sVD5AzueTiADnnFB+O/J1ykpDm5t7mVugXdP7qpI2GTpYn
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

> Add pcie_lpc node and pcie_kcs4 child to the ast2600 g6 common dtsi.
> 
> The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
> interface on channel 4. This is a fully KCS-compatible interface
> that is exposed over PCIe.
> 
> This can be used by the host for IPMI when the PCIe BMC Device is
> activated.
> 
> While the datasheet provides interrupt numbers for KCS channels 1, 2,
> 3 and 4 over PCI, not all 4 are described in the "PCIe to LPC Controller"
> section. Since only the KCS channel 4 is described, only this channel is
> added.
> 
> Ordered next to existing lpc node for address ordering.
> Use existing "aspeed,ast2600-lpc-v2" compatible string.
> The pcie_kcs4 uses existing "aspeed,ast2600-kcs-bmc" compatible as it's a
> standard KCS interface.
> 
> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index 56bb3b0444f7..ac351f01048f 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -658,6 +658,21 @@ ibt: ibt@140 {
>  				};
>  			};
>  
> +			pcie_lpc: pcie-lpc@1e789800 {

lpc@1e789000 already maps 0x1e789000-0x1e78a000 and 0x1e789914 falls inside it,
so you're describing a second `ast2600-lpc-v2` node which is unnecessary.

Suggestion: Merge pcie_kcs4 into lpc@1e789000 and use 914 as offset. That way
you don't accidentally cause an overlap for the devices if you describe more in
the future.

	Tan

-- 
Tan Siewert <tan.siewert@9elements.com>
