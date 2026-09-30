Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6311842E428
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758247; cv=none; b=CTHrdK9F7biN5JLHi3oPxhBUJcDOIHmt2bMcHNkWWq+DrPvMI/uCqp5t+moE/QvRhs/36OdsT4p0Tzib/RVykEK7+O1aewVbbubMtlKAK5j12+0cETCD/7OQD4b+BR687puIRaLXzZHEtFWZ0evQpM9P2bVcFe34xf70uDG/aAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758247; c=relaxed/simple;
	bh=mxzqvlri9Ibwbqo3RK2wB3BTMPpW+o/FKFXqTM7hluI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SlaxTpPpcwjfy6EuDkdRfdryEwe0F8qO0xWHJPTEZ1dP1B22/7oF/q1mDVpHZE6zRvMGQLigAnOsAg7oVTpjlATkGFK3ofuqxbwNVGIEByUIAUaJVr3EU8gahjXe6nQzuelTUkyWJH7D5NFGX9CuSTCLXpgKeDWIp2vtVpRurts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gq+Hkz3b; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gq+Hkz3b"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso53132725e9.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790758245; x=1791363045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=syerpKjnrG/V4/mGWnapKjB8nHZ5GCsdjKXFguWOck0=;
        b=Gq+Hkz3bHqE55uR4fG4B1XrJWAUOfWCcSJJbTGm8KzpRzJD6EGieHgT9FsvUdLrGOW
         e82zoDjtpK4xnSyUtV9Vhi5aXc/hIXV+X1XpU/ocu8QJUscaLESnrRnBA7V3wFCHijE+
         qxoBO1qeWorsqbiUhzilETTEzKEWrHkQFbR9lflE7MUA4XFC2a6vYnal1r7agDZD99Py
         kVvlB0p+hMfKIHVZtsWApaiHO7b9LzmfQZsPfzZneSuSf3LOizSEkVLw9ElYpLfPkCkK
         fQARbcR+uPqPVxe0arhcg3eljNyGdmdoRsVNQP81gR7lk+D7t3J1SmusN7WSCrnV1Hiz
         adDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758245; x=1791363045;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syerpKjnrG/V4/mGWnapKjB8nHZ5GCsdjKXFguWOck0=;
        b=uk0TXlEDEWz7ZXiDfExie2ILnwihmoqRY8oUn6zczk22b57kF8qkXFxoCVDILWizLr
         Zo3/dAV+OrMbUtZPxDYw0sK4uHGk0P1Zm++xGOx8MLyKfd2uLrmMCVxNYmFnkUH5ZG8D
         9sf6RUyt9DxLM3kUchNUDruCEQW2vjeWRDB5ztrvtJZe+lHRfXjERxBLJebUqcsK06t1
         E5MqCTGjF5P6cDHu+OoctvdIQEH/NFUSedxd8BdZn96Bc68pY2ZO48/zPLN6N9qSrs0Q
         hzMrrFpTpMcwvlOb2LjqqmMMCDRnm6TzZg2Y0CrgTbo2rXVo5C1a1buTF+/DKLVRDlGB
         0ubQ==
X-Forwarded-Encrypted: i=1; AKwUvByGBF82qLJ3299GDgORDbdXqw7lGYJFRUhAjsEAQ74EeC9tg+EvMG/Ad9CWuq/K+zCWqt0q9Zwi6cIZ@vger.kernel.org
X-Gm-Message-State: AFuF++m5+BnKxqn2w5MAiOj9QEThDYR3YXcQD5gJB/SPMVAGa2Cowjn9
	G5l1KMf4UYmF0NP5yN+XPLBaNMGkd6HgPOqLu6YLbHymiKLHwh8cbfvV
X-Gm-Gg: AYBFou0+U8Eaaii2Yd43DcFVCfI6nsZyWjwbOI/8moX5eXmKx5TNo11HSrvX+DABrI/
	AYsFzA7BFLnI9CgzMbbzkxhPjc1ghDyD9AuU03q29XAb+5CeyhsoVphfbN265iHUh2UQitRIDZG
	9Ax/Z6sEBPYB6bufTMU6HVAbdcbDNpzTyg5qWzAwysLKYCdRdhV6pXYk4V0S3TM9Ix6IdHEQI3n
	Eqshku8YAQPIxB3aHXyNISTA4xCOpQvTC+KRnKtehYjtTc44rNm1zEZAq7KCQA7bYljiNproO/D
	DZ2Ef1OHWsQC00627w2PVNbpLvmyDbwFF7/IVxRGvqb4ShiqizZlXtMBCMN98o+vPAWokHmDvQJ
	mgkUYWC1r0xlGUUhug3kjB3X1H0fLmjsHKm2gloHa9HNPAtea0YIVCzkLexBtvZgKs5vo+ivvjG
	o1rvx9ZFbLIrdZE59BbxU8NETiV5e7gFpI1M6MlbE9vtlQ9h9A4VEbrCnUUmGlFZKSyl7/+uiQd
	gcxqgK2gn3qKBPq+y3bC6B/RyL6YVoDKUEIMhcAsEIEHjc+K6VlENVpo4XfM/63FQbUQIFDUeAM
	B+wCNxEsRsjLrAs8NbPtucgW3nuOI8Gybhx/MEc3J96aYpDKCZP6RMbbhbwR3L+WDH3X+1Ta10u
	JAO+XxNTPDHvfjFOoYz+oUL1KnSutqNc3zdNy5OjlxkLvWgAzUwyeOHRTw3Gi1h17pFHfjk4/r8
	xAWQyqKVNUsFuS3ws=
X-Received: by 2002:a05:600c:4e56:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-4a01b00ef27mr11371415e9.33.1790758244505;
        Wed, 30 Sep 2026 01:50:44 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01751613dsm36189785e9.3.2026.09.30.01.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:50:44 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:50:41 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux@analog.com>, <jic23@kernel.org>,
 <nuno.sa@analog.com>, <dlechner@baylibre.com>, <andy@kernel.org>,
 <Michael.Hennerich@analog.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <marcelo.schmitt1@gmail.com>
Subject: Re: [PATCH v3 02/13] iio: adc: ad4134: Sign extend sample data
Message-ID: <20260930105041.0000303e@gmail.com>
In-Reply-To: <a57b3a24401b3101aa10b69173e5edbde326e741.1790719424.git.marcelo.schmitt@analog.com>
References: <cover.1790719424.git.marcelo.schmitt@analog.com>
	<a57b3a24401b3101aa10b69173e5edbde326e741.1790719424.git.marcelo.schmitt@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 19:42:29 -0300
Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:

> Sign extend ADC sample data for correct delivery of negative ADC input
> difference.
> 
> Fixes: e0bc6d7e2584 ("iio: adc: Initial support for AD4134")
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
