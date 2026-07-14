Received: from ns1.suksangroup.com (ns1.suksangroup.com [103.13.31.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9994030C368
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.13.31.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006283; cv=none; b=NE4xsiJ128VvS5YAzBoBEYa0yTYyrB2FCb4vvhjcSnGJydyec3w58Sdx+sLJoFot4nxfSL9noYf45oSeTDEYqi5iwwoABTbJ0+V7lBbL0zfttDtgOQT6wOKwn21r/OkGqPM9lfaP5Pw4l/g890i4sL2E5lCCQC8i/Edp2tBmRLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006283; c=relaxed/simple;
	bh=yCDlmAkpgFkrEYqdFyx+G0yyauuYMBLfNK1d4DuVdT8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BP+UO2EMxtNO4KsFR8qf8v5w0Q6En7lmlTPahzHVgHXU5lTa21JL2Z0xo5UZVzyOr+6EMe27JHT3gM7wc84zQJhxOl+1LnvZzVuPOXpWPY2VvtAJVMIE2wuz5LfBsrTQmRpCqOPNFAXvPd220MB/oXJM6xvcJzX+j+DX+uYNDAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org; spf=fail smtp.mailfrom=inbox.org; dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b=tR+UnB5f; arc=none smtp.client-ip=103.13.31.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b="tR+UnB5f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=suksangroup.co.th; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yCDlmAkpgFkrEYqdFyx+G0yyauuYMBLfNK1d4DuVdT8=; b=tR+UnB5fGfS4GuByPVV2DvbPaO
	Eo39QKsA2Vrpg2VXwihG/tAHm+DR8tjSX9INM8HxeRmWeBcF2KwJaIU022KLJhprDugJNfbWyz4Ll
	qPo7ZiQjscps0+OS4QGvh4vX4e+3kGSGReSRPkPYKMcZ7usmXFrphHgVIinDDbDsvKRkmDQYTpqrr
	/mWLpMhCf3S0HngCQrIZzFVboItbuLsOoyd4BS1zhRV0zputZ/8w6aHSFtYRi5jZOFasmUX4V9Glx
	rvnSGwkXYNHSg7CFzhlZHFMFUBF5L2RZZ+xeIbNG6iFdRn5ZHH5woe378auVGTdo2fhuPlyQf5sm3
	1gMbKPig==;
Received: from [207.189.26.187] (port=61400)
	by ns1.suksangroup.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <info@inbox.org>)
	id 1wjVWp-0000000FsdR-0JPk
	for devicetree@vger.kernel.org;
	Tue, 14 Jul 2026 12:17:58 +0700
Reply-To: hanns.schofield@lexcapitalgrowth.com
From: Harry Schofield ESQ <info@inbox.org>
To: devicetree@vger.kernel.org
Subject: Dear devicetree@vger.kernel.org, 
Date: 14 Jul 2026 00:17:54 -0500
Message-ID: <20260714001754.318B68DA0DBC1163@inbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns1.suksangroup.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - inbox.org
X-Get-Message-Sender-Via: ns1.suksangroup.com: authenticated_id: smtp@suksangroup.co.th
X-Authenticated-Sender: ns1.suksangroup.com: smtp@suksangroup.co.th
X-Source: 
X-Source-Args: 
X-Source-Dir: 


Re:Good day devicetree,

Please let me know if this is best email to send you the project=20
info.

Kind regards,

Harry Schofield, ceMBA


