Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC251EE0F
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 16:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663653; cv=none; b=YCTBZ0ctWQG9acwqAOgxNM7V8t1qQaFFNHSJzyNRTjnIMdIzKiXggZO12pS0RBaaKFsvbfnc9Ufot86bpkVkS8Tn+rtoNMVgNvxigHFRdygYMVNDMWLVD91jgXy6RABaAT450xh0a5Td24fDLy5IdRCbMnXUjxQWK91ClNAFfRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663653; c=relaxed/simple;
	bh=55CtH0fbZAzikPsEz6XWao1uKzcG+VvgI4ZlHllnCxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SKdwZkd2p22wR8sVPUB6EZn5iN9aQq9o+1GYLyPR8YXc3KOqIEC7KPC3mlKbADdDb9JG/DRsrw74ph8d6bmpBKwvkdZmr6UjiMczGW6YHaBlfo16vnPKFGHlF/LuGJxUyRp5cY+5oWGAevqExkDJcgOZ/QZ2I+qMGZI2A0t0cT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFg0+ET1; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFg0+ET1"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f13d76so1104415e87.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789663650; x=1790268450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvabIRYgCeoTg/LgMnCJum3NjuE2OsiV7HRI/rmr7nA=;
        b=jFg0+ET1kT3JKd24nHSS+Yjm83qCojRCbeKfmWBXqLb7dNZNpgZD7yiS88kxcNLmtN
         kKWrA/NhsZpkY3nuaxFIQafiqdudAlY1/7z3L8ff148HIQ7AkCGOKPf7FhtTfmFxHsr7
         sBHkycn41DA6T4VGKuNW9AQr1HOp2AIkePQcqSGmagy88LeOLS9n/ZCseYzO7chhZ1ep
         mGrFplfOACVl/ZfuEqUcOijvmtY6N+nBDHFyjPpEE+w/80zhjF8BqBC0lWvd4mS36f/l
         QNvw5hR/cyBUnOZ7xajbgkkHHCAL6MXRKKUMmZgL5D3iryd1A6uGPSEew99hl1gj260+
         U+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663650; x=1790268450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvabIRYgCeoTg/LgMnCJum3NjuE2OsiV7HRI/rmr7nA=;
        b=OchxJNndMojz/EQZVSlASHGCl27CuJ13fCwBsUhu/H8MZAclaEbFbsC060S6vvsGjY
         c81ALlpDYdRw9K6noUGmOZwAvcOlydQuefH/G3hI2XjswlDfVHvKpE13Hwx3cYSiSomG
         NyBtZnXamvtchsObw8bF/DMMxf+9IcQvRxmikA0/MChQbOHRuum8KUTwkUl+8r6yyiZo
         pJ5mP8PZqyVeuLIE27KQf+N9LMpwcjDU6e1pj5vT1CZBk2RsIRmDZ0fTlC3ZGohYGQsn
         8AV3O2y4FFic7hOHCgud0aq2dN7TkVuLMz10I76ZjoBUe+dPvlG+zQ0Bhs+q5tIH+XRp
         Ef0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwwXgyF/w9P3fc8Rk6Ggvl3qADSeJIkInfkFxYoAwMKSPHfpisY2lZhvOY2Sok/izu0fFR57cUdDJ4Z@vger.kernel.org
X-Gm-Message-State: AFuF++mTyElJ6/l8HBidAEN0ZbTZdTS/1cfj8kaPtj3meXdlMpa8o/AN
	i9sLxSsqBd3V0lu8cU2ZoI/FAaPXqm+pq+ozi4Hyz2V4rouiEELEG8/XHFe0u9tb
X-Gm-Gg: AYBFou27CkMXRkLizougm78RtO2mnyZiShKM/hV6BTNAdyQOl6NuwLVyUnQKRFC+nbH
	GtoE/4Wzy7vQxzBZiSGD1uEiKZF4BKYddqoFaZQ5sFctokQeRUkP8MMEiNckBICAj0D3ICC9O/V
	1JxviuXZcQcgzaQOfrFxqvg1nFx49RqgrpQhkrHYSkGUe4pwvwmriTNLyR+kRoxL2EGaEGb+gmz
	Lo605fARN0iZa5x8pdAQQFJT2l0UuoaNT+FL/VVyaOPSW0JJxkyMLCoVyovIKJ8hp8Ltq50FsJB
	vkSiFkAPUsgRKjjrnkDLs/WXSdLGxvik2rwCTY1NjyLfJM2BI7uZUD4v6SCgr8Iw3vaDcyrf3ZU
	KGgzHjb+TcCJQ68NTZSn/rBD9+I1OHkPbH1EPQLRkjE83KT4+/1JUW7o1leJbSptuPkKKO4Boju
	0yjv5/+HYPP7hoIjTsebjxV0nNiS0B2IbfCsDAaW+dkIYMfqp4cIBScy+VClgZd6+ZeGjJfHXXd
	Q//lg==
X-Received: by 2002:a05:600c:4e46:b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49eac467939mr79863725e9.12.1789657786255;
        Thu, 17 Sep 2026 08:09:46 -0700 (PDT)
Received: from chicken.. ([2a02:2f02:5101:7300:44c:8311:3d26:e514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbbcf5277sm96906755e9.3.2026.09.17.08.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:09:45 -0700 (PDT)
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Matyas <matyasdaniel006@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Matyas <matyasdaniel005@gmail.com>,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: axis-fifo: Added missing binding
Date: Thu, 17 Sep 2026 18:09:37 +0300
Message-ID: <20260917150939.477489-1-matyasdaniel006@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026091743-sanding-shallow-2472@gregkh>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 12:58:14 +0100 Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Thu, Sep 17, 2026 at 02:48:48PM +0300, Daniel Matyas wrote:
> > From: Daniel Matyas <matyasdaniel005@gmail.com>
> > 
> > drivers/staging/axis-fifo/axis-fifo.txt file described how the
> > devicetree of the driver should look like. Convert it to .yaml file.
> > Issue found by checkpatch.
> > 
> > Signed-off-by: Daniel Matyas <matyasdaniel005@gmail.com>
> > Signed-off-by: Daniel Matyas <matyasdaniel006@gmail.com>
> 
> Why twice?
> 

Lost access to the first email temporarily. Should I just remove the original email?

> > ---
> > 
> > Sorry for adding another email. I got locked out of the first one for 30
> > days...
> > 
> > v2: Corrected syntax errors in compatible:
> > 	xlnx,axis-fifo-mm-s-4.1 -> xlnx,axi-fifo-mm-s-4.1
> > 	xlnx,axis-fifo-mm-s-4.2 -> xlnx,axi-fifo-mm-s-4.2
> > 	xlnx,axis-fifo-mm-s-4.3 -> xlnx,axi-fifo-mm-s-4.3
> > 
> >  .../axis-fifo/xlnx,axi-fifo-mm-s.yaml         | 257 ++++++++++++++++++
> >  1 file changed, 257 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml
> 
> staging drivers need to be stand-alone, in the drivers/staging/
> directory, please keep these files there.
> 
> thanks,
> 
> greg k-h

Does this mean that the staging drivers do not need a devicetree? Should I just
drop this patch entirely?

Thank you,

Daniel M

Sent using hkml (https://github.com/sjp38/hackermail)
