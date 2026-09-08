Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBF256E06C
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 16:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884996; cv=none; b=D2VkSTM53hrbJ32wmsUOMJUAqd9a1sbNcT29AfI1Wf4r1q2KSX0m/IuE/vfw4N1X8aCIT/wuw6pXKcJaJ5A9ccns6+BXNeR/g+X74FPWLhqe+3xTngR+LO2pA1gkuaXIayKCCBzRlN/VlcM7I6GsNh2xsa3GPw5r3PFcOdqQJ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884996; c=relaxed/simple;
	bh=RwuYV9Sl7mHmb36wZxRTPspRiMkOGbxObIiEG/b6AVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UgW+AUa0H8hhCGnef272i86kPtCp4/vjIzC0k8Dy2XdGG9yifGb9EU6PrNAecNKOCROupb9JmYsT9CYfDJLLjpFFXxW7MTsecsGxQMFXBHmaKzltmCRM2iJTHIjdeYB2hnzkKU7grbRWd3JiF1t02bK//IDBj3ExR8PU0LwS4Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iI+NeGIq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iI+NeGIq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so39275505e9.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884992; x=1789489792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1OL80AMZio9aS7yB2uFhxd88x92rOLpg7Akucp7hrI=;
        b=iI+NeGIqExsX8Oc+DF4Cu8olO/QHCp3RYZDbADI9rOQxZ8TcL4fdOoJfnRy7ct2cLX
         xFHto9nE0eEs5cc/WZ3KCi1vo+d9LU5R8zWLLge9L69cN+B9EBNxgcTxoLWYePaSMikD
         A5SJTqvLyqNd/j32ZlM2cGAKNbjYj9kXv5VawcKibUIMqJbC0v84FhIvAOuNW9RE9JfH
         2qZENa7u8BI3ouWuhLZDby0Z5kgZGI0eX9yjH45Dg1My96SmKaHmR1uVFBrQdfrH3No6
         uDi66/MlOYZIShR/ZKZ9JO6NKr/HG2Fkoc4Wbxq15+64uVzA/0KItiG7ChWvCp3yJXNq
         DnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884992; x=1789489792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W1OL80AMZio9aS7yB2uFhxd88x92rOLpg7Akucp7hrI=;
        b=X8qP4s1kJS3jTI4UOMzvbO+B1PDunuOg9MHf8UrQTA/qBlo7cYRHlGG6VZ6WcYEej+
         tPfoeYMNGOHekGvBbPZqSCisK21EyGC5zrNTEpGfL/seLffYBv+shytad4cXyB7Q/XyD
         HaNmP4adgbp2sTNWvHhtiYwhVOCIpT0nL28Qb6Eh2b7IO+z7tvFh+TNySjVjIs5YfsrK
         EGrlkTeWYHfrlTrH2koZtzewuuliPf9SjsQQdqoYuxm7VCRWVUbIh7CDoQKHlVas5+Om
         ZSIzEy8i1mEEQzRgzB5HKVO8EfE/KdesRByqvCaW4/KDpYv3vJKaT3U74hdaYjNw2SiE
         HuYg==
X-Forwarded-Encrypted: i=1; AKwUvBzepBOEweIqr8tzx2sITGKXAYWvUKcVBUujFFatHXNTPBr+afZWB1sfAwy4wGI3fqkEakvZsU1KsKgW@vger.kernel.org
X-Gm-Message-State: AFuF++kTHo9aOJQrAacjtNXXNaS8BYg2PbtmGdM5EITlc97yh42XGJRU
	o35Mw0G+b2oY8U2P4anbbUgoqXH0d0OmLyXDlONBufuy8ZvUVSmQQPhY
X-Gm-Gg: AYBFou0Xdo/RPQXA8/KOAsb4c3DhDmtMDw9CXfLE0xaQYC/k3TftPb6kwIgyCCUe3cJ
	wApSSnHCBD/a6JZnrRU9nUFPIIAFkqGc+XMH57OqX6pvN4aQmZfG2Mm7mse8OUI+B/w71Wcoy8H
	snr09oBDRazGgtLHs4mEW6Bb7jnnXmiV3UrB+b5c/sJ5eLDsYhfSAYDz0Ha8id6cWqGULTV6tIS
	gufuLYnijWDJ9m/XNrxmipF8He/MBIzUbZm4Sv52n0zqlmEzEAVge1LZ76zE5YiC2q8hEvjm0rx
	Gko6g9ewptfIFQx9qCzCc0LatZxMBpnx5N/qlEnL2XUd4sZZ9iM5UjgY09rrqhXxvmM5V10j1Jd
	J/masz81YIeDSStjHn1cC2Y9BfrJah5KNsiRH+2NbhCdm5DT9ZHnUav1dAXIMfQsMvwRbQ3FhPA
	nGAuClqZFADsbzwnBRP9L6PgRfoAswnK9u0R5zdU7w8b7Hjj4q7sejkqvjmIaDrZvAUW2h1fFc7
	HlYneMVI2kDrKtuuZ7OBocVuJxvXyPy/0sc+VSTcA==
X-Received: by 2002:a05:600c:46d1:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49cf820c992mr311945925e9.6.1788884992168;
        Tue, 08 Sep 2026 09:29:52 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm571758155e9.13.2026.09.08.09.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:29:51 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: ti-ads1015: Add support for label
Date: Tue,  8 Sep 2026 19:29:47 +0300
Message-ID: <20260908162947.5446-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ap_kA8laT70faM9B@ashevche-desk.local>
References: <ap_kA8laT70faM9B@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 1:31 PM, Andy Shevchenko wrote:=0D
>On Mon, Sep 07, 2026 at 06:23:04PM +0300, Flaviu Nistor wrote:=0D
>> Add support for label sysfs attribute similar to other adc devices. This=
 is=0D
>> particularly useful because the label can match the schematic signal nam=
e,=0D
>> identifying channel voltages easier if label is defined via device tree.=
=0D
>...=0D
>=0D
>> +static int ads1015_read_label(struct iio_dev *indio_dev,=0D
>> +			      struct iio_chan_spec const *chan, char *label)=0D
>> +{=0D
>> +	struct ads1015_data *data =3D iio_priv(indio_dev);=0D
>> +	const char *name =3D data->channel_data[chan->address].label;=0D
>> +=0D
>> +	/*=0D
>> +	 * Avoid printing "(null)" in the console in case label property=0D
>> +	 * is missing for the channel, or channel is not defined.=0D
>> +	 */=0D
>> +	if (!name)=0D
>> +		name =3D chan->datasheet_name;=0D
>=0D
>Is the datasheet_name static? Can this rather be made only once=0D
>at the probe time?=0D
>=0D
=0D
Good point. Yes it is static, so indeed I can move it to the probe function=
.=0D
Will send out a v4.=0D
=0D
Best Regards,=0D
Flaviu=0D
=0D
>> +	return sysfs_emit(label, "%s\n", name);=0D
>> +}=0D
>=0D
>-- =0D
>With Best Regards,=0D
>Andy Shevchenko=0D
