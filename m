Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6BD37F314
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865350; cv=none; b=tldwwRjPnKVdjHv03Rhid3T3eIyfVDB6m2VXibjepKSBgmT3DlaXdl9NEdtosLRXrH5s5E7/h5uGvPW0D9cNKtfplfNq6WJNTm4lxdfwSV0X+IRU4wWPz8uZI1Z4PF6rz1yDtqvckRTKMc8yJ3taOVBByXSpYCFoJ1iGZ2F2wvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865350; c=relaxed/simple;
	bh=+K4HZZsUyx+BZ/jVUFt5QSnww12hfGtHUXInz1C3T8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2oLDMq94VlEJKBt52m5uSu5PbUMsWeKWO6hizRQvcBJWitine4M3lUHwKNZS0m9SA7tyn82ZdZPAPD06yAHb1JB8dJyktKX0OxSZz0u8XCYNvJ0YLH1pn0jSW79l0RatHGnecruON5VlHyUnKvVvnrz0PPUoK2lsj6xB8m4vUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AeKdo/IK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AeKdo/IK"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e6038cebefso19092115ad.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 21:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791865349; x=1792470149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=moe1szgBS8qfOMQ+dx39iq+IYSEcWmwG3cQfQWaqcvA=;
        b=AeKdo/IKd/Md+Sf/OL2oNjaEijynaXekhX+r/J0FGKDhOIss/7IUw9XynWO2CyD1HT
         LOfyggL9vIlq7KMg7afdFFs5moLsw6ukA/ts2aiY6j769/VGYVSS135VnVpA+MxGLYwL
         x9UxDKfwpyV4nCUTTaJzsNQeFeR+fgi130aiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791865349; x=1792470149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=moe1szgBS8qfOMQ+dx39iq+IYSEcWmwG3cQfQWaqcvA=;
        b=XkqZ2uPYG93RSXZ5UjuHAq61eBviuj97ekkX9L58/Z+WYwZ/NnLo86SoUZ0mAWj/gi
         DPYdoKF1epfucm8FLAbKBKfQTBRaeUXK22to6RLb+HpIYgo39nbYsuHLJ5VwwjR4ZUxf
         o0OkYEAaKqwvI7BBveSMoBEsWycTKtqHF24o8WZWeI3LfhRS6wgNrNRsZpixVTioyjox
         ZEQFTR6+yh0JO2XJooPLT2PcInofZa+6OfO79ZdL6JdknwBorBq3YzrjqUcSU3jHi5QF
         awRG2x3t14e3LUCM5WjSQCVzU974QJ47OFwpbrIX8vQmZBtksaIMkyIIdGmwjWXLADBo
         E2rw==
X-Forwarded-Encrypted: i=1; AKwUvBzusZlek28psA3TLYCmJnAg/6KUd3z9weKG30ErhnShB8XV7If7a/M2nJTowVnlJFOeJbZPyUYVQN7R@vger.kernel.org
X-Gm-Message-State: AFq9FYLeDQXI5D9b/43MR6qp8mFPrp9zX/oMHdbJcuE4oxjizLqjyq/g
	QFDiMw2YXnAND8SxdPzGgzW5ofQ1Uyxy8gSUucVAPwKv/awQmfy0kLM+XdHtxpO/Eg==
X-Gm-Gg: AYBFou0XeVH8aapH8Chzr9MryBZioAMl1gV28tghjs/VNPQWquJN3V7kc20wi7+rG+H
	M5raytkYHgw4dPiEkKFU/YW8GjKwJzcI+gR/rs4qegJuWZeC1QJqRcHE24FPR9bEois2MfEb+67
	aR8sHZhoaxZlOegrasuOGopOlkTGqc/WLEDLJDaE2nhMmTr5p4Not0sH6n1r+FbBEs86i0EqOrk
	pRL3HUGYjMdKpGuTF1/cUkQedSpqd8LjI5rsxKbOkVvO/igqRnasUbm7CTFDfUSKXTGdzJVemAN
	HARCuNS7ukWFm774LVgjRkxIrkWGnofrn7WvZEXWpiYpJFWDj18qaKjLz0qmhGgIeZ8pZFj02FX
	cjGQXrZGcK8NP/N6KPOWn+ZmCj4aPRNJLVE//dWInOvu0obvrnNADP5zBpACLNHa4/rDsZ5QDgU
	H/JfKLv74XoF6VpV10gEPHBoAxngeCBzHp4L19jdmBcfucocgfXmkdysO6B2bZrMyp8I+JmgvAz
	dW6LvVn+pQ/hNam8ZlxLd5w3DIBlkFd+aAq5g==
X-Received: by 2002:a17:90a:b90:b0:3ab:be66:ddb7 with SMTP id 98e67ed59e1d1-3abbe66df61mr3465361a91.47.1791865348806;
        Mon, 12 Oct 2026 21:22:28 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:476:d384:7c2e:1579])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39533ee7sm11566916a91.4.2026.10.12.21.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:22:28 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:22:22 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org, konradybcio@kernel.org, 
	abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	minchan@kernel.org, axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	djakov@kernel.org
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
Message-ID: <as2xrbm55Sjq3T1M@google.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <20261001-dramatic-hasty-pug-68ebfd@quoll>
 <ar4070oH8lRCJMRw@google.com>
 <6713512a-d879-4fdb-9138-12e125c21ed6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6713512a-d879-4fdb-9138-12e125c21ed6@oss.qualcomm.com>

On (26/10/10 02:54), Georgi Djakov wrote:
> >> So entire qpace should go here, no? Why did you create this entire layer
> >> of indirection, singleton management under drivers/soc?
> > 
> > qpace seems to be standalone/independent arch/soc specific, and can gain
> > users outside of zram (fs compression, zswap, etc.).  zram's backends
> > potentially can disappear all together, if we switch to acomp crypto API.
> 
> Are there any plans for switching back to the acomp crypto API? We moved away
> from it some time ago and dropped all the crypto dependency in favor of the
> custom comp backends, right?

We moved from deprecated scomp API and switched to our own comp API.
There is a possibility of switching to acomp API in the future.
