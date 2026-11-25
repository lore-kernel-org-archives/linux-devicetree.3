Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573927;
	b=FSGC9TDdVx0q+7Bq0URjlTkWdYJHNFZkm+ZSMC29Ly+CKfsi4No9SBUxB59WZInofZEr
	 Vb0h2XuvYA9r4GAvsVX6LsJZ3rHkrUF0pwBZx2mJ6D8ewptGSOaiqpFibulAwMD7waU57
	 Xu6aSZBoRhoIDrrr3ZEVOaV9AzCEjpAB0eXCHcRopoRd44Y/h+ou33A0F5/J9m8BtoHaB
	 peGb5RVYwiZw5ysXpZpgnO61k9mycly+dEyJnLXazFnINuN8YqKyrpOBaOrIIKxHGQXXF
	 WlMEtToiAolb7bxjE6Po/55YtAbjzXNqQk1N+9DXX36X2DVtLP2PW7doFxRoRTkFX+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZkakucMXa/GLA6c3NEIv0nalbNEBO6xsvd9bftKJ/G0=;
	b=ZlZ0OLdb8fGpkUawdrKK7qWoEB2b+zGRL1ba4jL+BZ6V0nUL+u5UvnqMhxlco7WBBbIO
	 p+KAW7Jebg2Pp6ASxqKTBHvcAeeaSeBUkkKTF4sPCN6nFNQp8vTk08O4Bw01oaLtkoLJs
	 dYSj5jT6zSzHwGGKqHvRtif9+OCMnWfSbhIeobI/r8J/UfZEdW0bQNTKLxgpgnKRcA6/T
	 pioIASfXo9DJPrr0zms1As5Fsu5lYJ/BREPc1e5LLg/bqBxJF/boaMMy8JnScHaT+3NfH
	 oj1tUXQ4cHZt2jCcrdOy57sonPRLXfNlv7GeN46egOjAoqULPzqTXQR+WHGck10wpsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fYJ1MbM7;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBE2606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBE2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fYJ1MbM7
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38190551625so10520724eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 18:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573926; x=1796178726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZkakucMXa/GLA6c3NEIv0nalbNEBO6xsvd9bftKJ/G0=;
        b=fYJ1MbM7KOuGMRCQcWCIqbfMFOr2CUQf/B4ldHnewSb4cE9+E0UiaaU/soSCEPq5Dv
         QHXY0aDlp0D/RDykZzPagQjfF3Bb1TR9D2HLkw5cJJa/RI7l0DS8rmtLSYn372k7W9pe
         FmNcn1v4CFhzOVrhoyW5ihXGylpn8ajH+Gi68rsERfTmgWWfxZocFIqUdK/cpfHZx5RR
         Qd/9xyIg7bE3k5+roqXV1QtL0v8zpAJgszjD3SAefDRhLZsZhhB+FF8UaakaZ0t5dFaj
         FKHLBCZNs1EevVE0mbRaQ/4QDMVCoI1rlucSesLMTKQ638Z5qjL+UwbZ5fZF42mLQeNG
         jbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573926; x=1796178726;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkakucMXa/GLA6c3NEIv0nalbNEBO6xsvd9bftKJ/G0=;
        b=YgkBThDHJcOHoNoB+Ttfi1HGIlElgBiijh3UyHm6qM8lee13Y0r5BoG+L+wGz5DVt1
         eZ5Gj7YM8Nn2cgPjuz6LEIuOBXKEMd1sJl04KmvJ2gayraU44hjwDgTo0Z+zyaCssIQu
         nUD7FD0TUD6C4P6QMaUE+ji4Nc2sjW9pX18h5PCo0E39rN/FrGcCp7eFqmUeDd93cjE6
         5Ylh9Nv255hqKTHu6Fu9glEmnFwo9ot5zT+r4IuG0v/+TWYjZihGVprqqaFeoSCZLsaQ
         LaOp1Af3FDzZu4rFlMaDsSou+VpsSC7OOnhzai2DISoDLRIT/5Ob52qcU5jNC2Cctzf1
         BCIA==
X-Forwarded-Encrypted: i=1; AL+hErHNDcndzl7TxumpXjHO/F96KLTN4jFKqkUi57Wm3jiF2/OXawzlNb03gUIiik3w2LFaUtCaOQMrWV/Q@vger.kernel.org
X-Gm-Message-State: APuU4Z/Lh2pQmET9gr7VH8RnZ6EWL94kMeMZuCKvTlbfdnc3vl8UkS11
	/zFl1TeFjhMwhahhgtBIcc2Sa9+F/36EXtNLDrsdvpIerwfO7cV4k4YJ
X-Gm-Gg: AZFdTZcFpneP2FrGyk0QDjHUdxnMQS2H8NSlg/usLTTa2ui+qB9+2Cqy6a8WSz/im5S
	7X6dG/xqdvQ+0hiPQ//yb7jz05HN27bS5vHp7RVdYFkvKMboRo0jN4iIz8fYFvNI3dYwTD6lZgA
	CENUtPohPNnk6nfWpBZ2cyxCvVCneB+EtmA5NIe46rqdcU/BG6NECYXCPbJfS/evpWe86Awivw2
	d0qNN3CINChs4gWs25Ar9ETGGEJzbhJuWSQi9bPjsmKq1IV+uYYtCk3Dd0zJltX/mkHgHn5xmjU
	jgt14+bZblWTEywvWEZLPLGcKkhjeuErerdCxWce1zbaHv+I6irRraQv4wNMirkesJb+FDm/B8Y
	W3SDFZacnDGSfytqMMdqlaDtujRKDbaZWFi09Pgi+D2Anpm7qQMh45yzYbRj7beqKvI7tN22ABE
	IfZM8WjsVJAPILaDTmMMtx6AVLfv3k0DTexd08EGaxOiVmsi2vz5x4EyGlziPdX9hW2J9yWGSoL
	KFnu5hK1nu0TFJ9ldMuiQy0+z0tQ3Tpy0tmxfUBcUnh1QVit+hnBZmoa2h5sNnPQBwmjkMp4fyi
	u4gfr4CsJPeXDNKpdmchNoFkTpLeZl+CqY7nsCpL5aU2wuiOf+TaZFhLHEmR5IV52WuGsAI=
X-Received: by 2002:a05:7301:182d:b0:386:b801:cd06 with SMTP id 5a478bee46e88-386b801cd3bmr6055021eec.40.1795573925600;
        Tue, 24 Nov 2026 18:32:05 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm50729285eec.12.2026.11.24.18.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:32:05 -0800 (PST)
Date: Tue, 24 Nov 2026 18:32:02 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hefei <3066883572@qq.com>
Cc: dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, conor@kernel.org
Subject: Re: [PATCH v3 5/6] Input: add Jadard JD9365TX in-cell touchscreen
 driver
Message-ID: <awZIEjbpVfVNoc05@google.com>
References: <20261125021127.1430-1-3066883572@qq.com>
 <tencent_03FEA6A02E8E137CCC5AC97E6F118A3CC10A@qq.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_03FEA6A02E8E137CCC5AC97E6F118A3CC10A@qq.com>

On Wed, Nov 25, 2026 at 10:11:26AM +0800, Hefei wrote:
> Signed-off-by: Hefei <3066883572@qq.com>

Spare a few words (or maybe even a paragraph) for patch description.

Thanks.

-- 
Dmitry
