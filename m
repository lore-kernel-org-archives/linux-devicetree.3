Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDCB175A62
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 04:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915156; cv=none; b=s7Y4Psf0+D9//Vk3Lp4QvSGV1DtVYKal+Pf33dTdQXCBjcl0ZIj9qm9AH5VOwhRaxbO16TqteP7q0mTOnjx6y+slbdtseiJMwBthtYg3mCzpEcVTzuu7gMuE7Qj0TTA1FB8R8upQFyKnX0OrYh+WvY1tl4zn2QiAqpoMGKG/PPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915156; c=relaxed/simple;
	bh=ACqoM3lhRSEInVEWKQmPKHWGAzWgBHfhlchOvGQqXog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tpBKbNNcViEkm+uHIT6mYUs4Xi4qHuOCddX7s1dmWQrzEoP3PtpPxIpuY1Vz9sgsdDD2qO4muz08+p+pp7S3EkiqSpZ74Twr1ofFojtvnqBOOqsX8Obz9V/fC4XWMAesz1LAkNAKUGFtEDQuoyaky/KKQqQ+bai9m7r9dtdpDCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CV2PfXr+; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CV2PfXr+"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso2873120a91.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 21:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915155; x=1791519955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dudqi6EDOW0D74WKftHh0rXK9Y4CE90dfuAFUDIQs0k=;
        b=CV2PfXr+rrvqx6uBoRlnQwsq7JR6mFUDHxyf7WlJ9q1xokir/vThbADuIjTgJxOa7C
         3aEnRqMSq3kHkLQ/IPA53PUaLMgVCoemDGuxWUMztyMTotqJtT4sHFaBeux7ygTIelN/
         fkDCQCgfxPOc950XRi/Z+ap2WN0io9wquraHefZAIrdcXKbT2qvMAtR113ll8+C7m1n5
         IY4L83/AS9vBNlNdDPUdqVthBYeqkMAwozdWLyST99iZd1pOoM3tfGHmQGPv1bmErHzc
         8VC9EfecIgsLn75Qb+MpsYNAFTEbGJ8rsITe+KzsppuCbENLl3R5VTtlFKmTWWi3QQXJ
         UdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915155; x=1791519955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dudqi6EDOW0D74WKftHh0rXK9Y4CE90dfuAFUDIQs0k=;
        b=ef6DIMcnxTWWYe9dNOBUAF0ID5vrMDf6KO2Il/L4qFIEUUzWiWX1cVg2yztMt4FGpQ
         qhiWOdzs6K7T4wTbtzzYFkdbcueA6BRzrg73h6kE8x1rq21sT+Nm3ct5zKvfHe+6t8B4
         HjpTzhEF3/wzG71d/chQqvJVcVYhG4gGveAprPt4GUKdU5FkbG9ZfztyVIQQwlZP2zY8
         VQpC+1VuxMvGND+qHKZOpSid3XkNaXnZjDh2JnGZnlATFVJWpdA9BiFjSOCoefES/Esi
         mVrsOHNikTe3DjNQX/IkKcleTzjI6PP/ehYkoIQFSEtCCk14YYxIIckWY33TjpGCb6Qs
         DVLw==
X-Forwarded-Encrypted: i=1; AKwUvBxX1dZL8RDPjNrkTOTZL5fOp/dKSVM3/hs4vdxGU78v278Z3TuceSjqEHXe4zJ3iVAj9UYAncJmy/Mr@vger.kernel.org
X-Gm-Message-State: AFq9FYI6SEH08O662zv8aHHOIxE6F0ZlYhsuuqqaP1Wl5HOLnn4G7aFf
	mj2sr2MRyi3QfsrcUNQpcLFoKM5AdmeosUdG7EKgXrnskStH9ZvF8sgGOwhiK5cS
X-Gm-Gg: AYBFou03KINfsHw3+bSNc4BWrPktMKpTUw0UL3R5TxRKgrBH6AFPRLOzAHbtmELJ3Vt
	8DxW1Sl6MqhFgAizByNHMttlvIidXbQKa0ZkRG0y66zqXBgj75DXh4wRXpkONxs7sEZ0nxizwCb
	ZunnNJcJ88unDT/dgdGNkPhCET3OrElLZnAq28Rm6hgZCsPFZoNfWhDGd97bnDU1oEvhuOiuLxQ
	4MulsYqqeddph9ON1JpHQkMw0Hozr1vYiZhNWKPdw73+B2PAp8Hw84rYP785UsQckBDNqUpcnt/
	7Vt7NB8bnfn6BVjsgipF6A8AuD5SgJHhLXOXKsigfQoVijYLPPVrwXtDanmu94DJuCVSQc8H3qC
	STFVANZ8Z0+eNDoXOGo9Rni6uXHoQIj3OvWfGBMXNooJh4Fi20xCAouio9FkLr0Ix2akzNswxXg
	8xEsEIYOUXgjvIy0R1W3rcfBTN36rX1j3SwYrHM7xNe6AJkEF40ptprHqdhYTAlzylf5O6eRRkT
	DRu0Xdg9tMhb9SAWqT+1cC0riAD2yGfGYFai+0agK4omrw81VM+7Xl5YeZWGxYPwfjFUZiuKlfJ
	pWPO4xlPIgM8GhPDUVERtpbOZX96nz3KVWEG28BMtbeUs0W4Sfr0uGVmHLA=
X-Received: by 2002:a17:90b:2812:b0:3a4:cbaf:f152 with SMTP id 98e67ed59e1d1-3a6cec2fb6emr670470a91.33.1790915154749;
        Thu, 01 Oct 2026 21:25:54 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4709a7csm7139662a91.8.2026.10.01.21.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:25:54 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: name the robh/linux for-next branch
Date: Fri,  2 Oct 2026 12:25:51 +0800
Message-ID: <20261002042551.1674664-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001-stride-trailside-d533de737a6e@spud>
References: <20260928105951.2187076-1-matthias.goergens@gmail.com> <CAL_Jsq+k8GsoSgmSmVRMdOEj1fJMUZDvE02o7MsZhO9uWE0OcQ@mail.gmail.com> <20261001112526.3822682-1-matthias.goergens@gmail.com> <20261001-stride-trailside-d533de737a6e@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Conor,

> Does this mean that you're dropping and/or reverting all patches of this
> kind?

Not reverting: the few that maintainers have already applied stay,
since they chose to take them.  I am dropping the ones where the
maintainer said a single branch does not fit their tree, like this one,
and I am not sending any more of them.

Matthias
