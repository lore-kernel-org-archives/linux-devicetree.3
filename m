Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CA6496910
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778018081; cv=none; b=JwwyjeMd+qtqhAlWLgNtYmB1fUQZfRl3J1q39FMWBfI88pJC+Q0Dqzh7fGyR3ojaIFEudNI1YRInS/lV7m9YqH67kMjPnai5YwRJjrmc7kMPfZYm3L9HetS/cwBpJ2mDoVoZWKy9XaSggNWfPL0eYQTLAJiw7lebxQxs8/HNrjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778018081; c=relaxed/simple;
	bh=Z2huH/EQXujQCyF1M3eGhzyawOQuqd92ysZl/OTmGJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiTqhQSZaFmZVsKcoTgj7tKpBB9hJOBsf95vKf7B0CP1bA4DSpvhcVC7iX6fC7wvy/dKbhT6zm+D8MCFVKAUeUIeElfNN0dMhS4jaDWIcyTrmaGxzMMKCb1BrGuVLzQH5slrN0//e3/EVPRcvJEvCVfi8lmvAd1asCsDU//6xe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/53vS+F; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/53vS+F"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12dfbcc0703so464780c88.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 14:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778018078; x=1778622878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qn2gN9TOXcgav3hEevfmLoUHUeCTTlNmOyy5YzrGBk4=;
        b=c/53vS+FeMcLQacVv+h31lhxPSmgVWLYmYQBYDZwgntoj7qetk3qnpz5cjCvXqbHiK
         rwkk3IQbWB/DJLvj5uvOQ+DS3cdYK2g4PpInEgIqwYYnQC2wfkxCjgWEGQN2qoxEDpit
         06u+7kMtPgoAzr1Y6UQWXYiZPGjmQeBALkrxTubNDKQn2nMLLfp0DFIcf5M5yWtS1r8/
         /1DraMhRP+9Mk9YpCrEWkAHDQ6VealkMENOo2W+hiOMeAl30BqioIDqlmm5JQxxYzDnq
         KtyKGCk0579DYyhRA2Bapvoqe1tXxYMsRMKxfOrWJziYwMXslRqsOXKpt8H23KqtEEhT
         o41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778018078; x=1778622878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qn2gN9TOXcgav3hEevfmLoUHUeCTTlNmOyy5YzrGBk4=;
        b=HTiXmwC+CTjHlmPgxoso4Rf+J8sSfbp31TtEd0v9OsKeK2yhHF2qTpXqM+mnnQUKQ7
         D0c6abbioYCqAPND6AXT1Yz5UAzSnfCkwT6b7O2UlFM9Ue4JZwamA9W+XJbHX/eXR2W8
         rJhv40seoSzF7SlCi5468UPLA68kxLGiJu7Xg20Dpf1406lf0z3yCVSS0Q0ERoHT2s4Y
         Y4nvt2/OnhgASKJPNpP6uusrrk9DsLogT18qMv0bbbQAeSUYp4QbY0QGJnEOxZUYdp0C
         s3kOoHHoBUEn0QhjMP2/MWDDfScP6G/wN+Ho4vMvsqTQg1k1OP3bYRp1BF+W8qXkCXob
         gy1g==
X-Forwarded-Encrypted: i=1; AFNElJ96omAjCJnmnieCWESKneuPvZR2HoiI03SdxQ+jn+INW6nZXpT3LRg+d0aOiiNbi0WJcovdZR+Rxm9S@vger.kernel.org
X-Gm-Message-State: AOJu0YwpjTo6AEXPkZB94Rh2OKQhzm2KUA1KC4ANPZCgKSCEo/ptp+c2
	UiqjpLk01ugqVbtN1Seq1xppkTCwZGnooUXIgL+cUMER5NspSj9O6UpL
X-Gm-Gg: AeBDieszSrFWzKqt8DWeEv5WQmeGId3SBJPvXrsTGJH2DfC3qMfjvKIj3f826CD8/CE
	g5+0T7kXrgy0ngOCv2vBMnin23/b4p6puu0mpMxIsNlYevd/qcq9xuH+xqxKFjEc0NA4mMpZklR
	zSU+U/Mx3ONIOHaEQgVmeL9CpvYG+VvVbHUI2ZZU6YXesrkDUqRDncvdU/GOjFuZocQo6S+A6ja
	k0K0kB4lmpMFFyqeIgLdWVMDo8eQgREP9e0tl2icWAVvl+5HVQEpeUF0M8KZJ2MNcvxRhGoCUzQ
	jpi8s652UKIQUsGpgGw1cquoat9JpGypIDYDlR00mhk5FiYk/uGNQMv4oGtzjyGGqGwsV215edr
	ZccrEOXtnyYHPNgKYTXwIHP64cYzjnqiChwB/U02WbFdtaI5MR98V2+7GY+5pNeDnRtdqdhXD54
	LScTeRpOoHCXq7/aZroNJrXelLH4W8FTAoNqMMMjuSAa/jHKMwhpI+BFK6coyq3C7Oc+kt9Vt/O
	eM=
X-Received: by 2002:a05:693c:8110:b0:2d9:32c8:2b69 with SMTP id 5a478bee46e88-2f54a39074amr415753eec.28.1778018077853;
        Tue, 05 May 2026 14:54:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:94ef:a6f3:2c96:2d58])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec763fsm722870eec.4.2026.05.05.14.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:54:37 -0700 (PDT)
Date: Tue, 5 May 2026 14:54:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/11] Input: support for STM FTS5
Message-ID: <afpmQKJilpgDqrpJ@google.com>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>

On Thu, Apr 09, 2026 at 12:15:43AM +0200, David Heidelberg via B4 Relay wrote:
> Used on various phones. Minimal viable driver.
> 
> Includes device-tree enabling touchscreen on Pixel 3.
> 
> What is missing:
>  - switching between AP and SLPI mode (to be able to wake up phone by touch)
>  - firmware loading
>  - anything above basic touch
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied #1 through #8 (#5 with minor edits). 

Thanks.

-- 
Dmitry
