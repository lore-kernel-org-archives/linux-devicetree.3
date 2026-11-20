Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201011;
	b=NyrFUCFSWVLLNEimMyTkLBq5JJS4q90KjDNcP4rIg192S3N7J7dco5HmwoMWRk+5twhl
	 N5+zDdz2Sqv6JjTiHB+yWDjTdrTHdU8pIaCb40uoJxfwkyaF8dZ3QKEc+zQJ6bEjFoNSF
	 XqsRcJSRUZyJW/c4lprPqNrr9CHPKzeSI5xC/GZuCUc2n8LmYWH+3XF6y75s7zlao9tsR
	 PbsmXk39yiBFv8ksw4dwUI0p9LWV4lGrd3l3jmzCQsSpv4Of1r7jYXT3CIoS3IWQjsKFJ
	 yiLJnkb2pXWrXx5jpivyyEmxeb9Is81RVPiJN4HCoCrM+tO+ScI2bQQWF9oI58vDCKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MbVQtId4GZJpOwZIgQ5IVkC1l8C9teB2jkENg0QieKg=;
	b=KOLPEkOvtrX61tBKNSTFpJBE+68VyY2mVJ6OnXjAK9uJCweuEhI5AWOcqe2dkkIw6Chi
	 HXo+Di2DOfGZARG+gtWZtbYZ3efxdP7GraibzJHV4bDvzBXJWZyebBEYotqrJhuAYr7ak
	 1OzAdyFwPBCtais+0vNHoxJZD9OofqBNciaSyGuja+ADFhUXMSqx1pgnWEbbb4SaDjVd1
	 nja1qvsWFKtfui7DP/u3AkAVgxD/JFcVBJJM9EMPPRtQRs2jZSqdGY06iH0OYMzJcYf8Q
	 uLwxqoig/Y9YfdRocTmxPjY6J4Buo1KF2PzUwM8JAbd+MDN4UtKlkpngM5wVqOdri8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8GQQw9t;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A936E60A2631
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A936E60A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8GQQw9t
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso604884a91.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201010; x=1795805810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MbVQtId4GZJpOwZIgQ5IVkC1l8C9teB2jkENg0QieKg=;
        b=r8GQQw9tdT3JOh+6FNwiH/8laGLkVWuAdVc6z6ZwV4kBuFi5o/1q6BThpy4rU7X1fs
         TuK8QuWm48oz7IzcriEy8yV3tCvCGN1QU+PjHPwsmFaGHK5OaevpI6Nb7PPxNiq1mr4b
         a+Zg3dqp2LZSApuR250ogcTr0aMkngN70Rx1h8Jlyoa62yEbl5Vkh2BneroA7at+k3PT
         zHec/Y8bHDpQ8Kc9ETuh1CXi/orZMal93vpieAuHFLGBDnqhMgwzs5FOZ7eVUk/aa7/k
         zEWIBoX4cdB/pxY8WqnwBjGOw7lmI38HIYIujaik8O7UAtopthj4VpCZm4/bqwtefwVL
         ft7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201010; x=1795805810;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MbVQtId4GZJpOwZIgQ5IVkC1l8C9teB2jkENg0QieKg=;
        b=q5ETeJwi7DjspFisVuA217ePKQHzunzGftKsnQMSAoOWAe+RHRJatU2Sxi+NUm0jyu
         v0OQUdQwE5uVlqciEaR1qa5VBu13IpfHdGvfg6KuVgmumEUEiZSd1zZAVAU7JNGojD3i
         2ntKlxhZrTFzEnGhDknjBSra1TQoK9DFweDB7OqKjEj+AJnoP6p09HWjYV1HUYOeEY90
         JJ9lJx97eVq2sqt+Pw0x/BjwWfEbfYkPSO40h1hnM+4K0/0au/D3vI1kNOrCs3XhLA7B
         a9Owqs+P3jYu/Cg7K/C9HNhIae947OxMhC4Y0mH0+yp5BDc0gJHYHuVNKMncnbU0K0PM
         wtIg==
X-Forwarded-Encrypted: i=1; AL+hErERPfxzlNozkajYFF6K7itg/dTGZPM19TQBKvE4/Q9fZ9UZXtJ9tOIzEtsVrXwgKMPplWCFT9fbYYXL@vger.kernel.org
X-Gm-Message-State: APuU4Z9+etRDxux835vUxMd8c/70MccqLpopiMyTLhL3G8wkbJ6wk1Wc
	ZpF43Z5o35QPIR7+QQH38PH7nX7tuZ2oRRoN2JClibsSm9QoJo6zyeSv
X-Gm-Gg: AZFdTZce004ffTmBW+TwdSduxCKxsUqLAkAkE7GzPROnbBi0whfhhVhqGs1i9OCgIII
	b5DPJLL5V+pE07ZIDERgr1j7eN31QACi2NFQmFfhZyUuQ1duNo0S26Yk6iwn3/6eoI2UJRQz+fx
	DBHzpWNxFPV6+1XBS8j4Kw8AT1I5DdsglwTYwnGHxRexKzB7T8T0HvUXxQTUfBzLhhR3mcFCP2g
	eFG5Rm+UCMRhPG9EIprPhXzQBgojgvOMcQ4g1KPZ7s1tEOZRDKICDBVBTlqRzJsTHmOUbHnXotl
	/m4g0EAT5590MdUtggjUIIkj1ymiXyz0kBFTocvHl7R6PR69/5QG+c+ZMxxFqrezZ8nLDC9MeuF
	wuRIywuoB7cUPqxHY9qlx9ytpxNCE3x+PoQap+ho/GRYnw/Dl1K11l8z2V9aIZU3MsHBMU7f3EU
	cab+AJZWN5S63R1i63PYxzn3plfUw47hN/SrWTPXrl4LiMt7c34sSKK2hImKSwozZkfxCm+5MRI
	gU1fAY2uC4xHaQI99l9SYHtCvQRC4idcWI7OBLM0kyMwJTl6Uqwn4JgDWyO/0FdB4E4m22JrF85
	fwLxn1TEJnWnKfEwK19KDMhCGrbfqKTR4g70ww==
X-Received: by 2002:a17:90b:3c11:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b41c97bc96mr3964802a91.58.1795201009657;
        Fri, 20 Nov 2026 10:56:49 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:ade5:705a:60d1:a474])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm8484216a91.10.2026.11.20.10.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:56:48 -0800 (PST)
From: joonhoekim <26rote@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	peter.chen@oss.qualcomm.com,
	tapas.rana@oss.qualcomm.com,
	vkoul@kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes
Date: Sat, 21 Nov 2026 03:56:42 +0900
Message-ID: <20261120185642.1188-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <2026112017-flyover-grape-cee7@gregkh>
References: <20261119124558.1548-1-26rote@gmail.com> <20261119124558.1548-3-26rote@gmail.com> <2026112017-flyover-grape-cee7@gregkh>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joonhoe Kim <26rote@gmail.com>

On Fri, Nov 20, 2026 at 04:07:21PM +0100, Greg KH wrote:
> > -static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
> > +static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom, bool utmi)
>
> What does that bool mean? That's going to be a pain, please make this 2
> functions so you know what is happening when you call it.

Will do in v5: dwc3_qcom_select_utmi_clk() stays as it is upstream, and
a new dwc3_qcom_select_pipe_clk() goes back to the PIPE clock.

> > +	mutex_lock(&qcom->pipe_clk_lock);
>
> Why no guard() use here?

v3 used guard() and scoped_guard() for this lock. Krzysztof preferred
plain mutex_lock()/mutex_unlock() where nothing returns early [1], so I
changed it in v4. I'll go back to guard() for this lock in v5, unless
Krzysztof objects.

[1] https://lore.kernel.org/all/20261113-artificial-quixotic-firefly-84baef@quoll/

Thanks,
Joonhoe Kim
