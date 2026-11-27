Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785637;
	b=z4f2p4Y8f8iLCJxrwmPjV2PER+ee98yzBNv1NtRG01RchF6BdJ+wBpvQWwRcqsLvwgF3
	 ME4WKUx9gcCCvGzEyrGyu/9r+DIrTGDrW0/SsQ6eUhXfr2CJV2zpsnMbGWDz1VMrbvYOs
	 ovYRWMD4DnRUfSFwFKjQnmxrrTZyUhju8/TUaz/2MpdCU7P2vJfcevwgxXGr0ejoAYuPE
	 OekcC5KxvP/wXYh8arWwrR118E64PUh6Y/U6A7gsAox3nJ3QXuadSYZPq6Hhv8tLApD9V
	 V0rsuTfDpiV30eS7eYz1fdnZpo8uWaAz2vksSt4gILiqkg7T+I4v7oy2yGeS+0xGHLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=D+C2WErvkSsOZ4sk5Sz5TIE03pd4kWi86iFdjsd0GLA=;
	b=SxImKZFp87qM7tbKtJqAY4pKKXlFDpbhEC/Czcr8l82KS5+Enfw3Gtp4vLUF1PsdyX9a
	 2M7uRwPSUXFoSAe9GSDA4z88Vse4Z5tDQ4CEbpFluj7AI74nNtn8cLaXkKAYyAbiG0TFo
	 EKNK7OWfNQBqWD7yXhtLdbC09W26sQ7J1x9im/enCPjE+s5jSHWfcKkrffsEEWnGNNtFt
	 0JzFsjUgIAcp2X7lR0G6imlNRsG7jEjAVWKyQRGhdVYIxcTp9YHkmykDbUAZeL0oENhS6
	 3TAjGS+XXfvOIFXxJ3e7Wlnltqo2J9DsCnnLO1sazQeHnBDK67PH/KA392d3blOqJWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L82fFvNe;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D75606A696
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86D75606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L82fFvNe
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490f38e9688so5617000f8f.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785632; x=1796390432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D+C2WErvkSsOZ4sk5Sz5TIE03pd4kWi86iFdjsd0GLA=;
        b=L82fFvNeBuBbQ/UMiY0am5fSBNG8SHGYx7cS8n0cxl756hwrwwxPjEKnz26xtxl3Mh
         eZBy+hrCagwNOc0a3JyD8PvO/OAmJlF9nDtvzgOT4Qj/ge+DUDfW5SAtMtZ1sX+O9gEp
         F+OuP+4KbSVL9LknpvmjVKW/5F25yRKHohDDsmL0w+Ih22/JWu8HGMRtTrZSsA+u5obi
         FWG0fSR64lQXRnmUyEg3DEATLthFGgdr9DMMmqInRgYeS0iLvJgbfIcag68nBIAeUgHb
         ayhfqMG9qgk7IGe2TAXnS9enVaIkP4aGVJi6n5jpY4kOx8/qlDQaPJYNJpGYrHWPz6dO
         JxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785632; x=1796390432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+C2WErvkSsOZ4sk5Sz5TIE03pd4kWi86iFdjsd0GLA=;
        b=RfGSEBRENIzD9A3H3jL5tbMLDXfwxgk6JEmZrkTRT35U8GXIW63V0ovDyOwL4l0RJZ
         viZVGN6fxkgnJ8D/+Wmw7/9hhELBZK6LZwO5hsRd936Df1cLllkTtHyRcYPbgnY9Eh7H
         jsKP4F6XhNNSSCLBGGkpGsc+sSRg+g8uaxFdX/vUC132KCnHuOSTZHbE/h3fSoFgxTmE
         w+L5lhKzu//7nnruZFVxRZmIIzfck9SJqwS9oNnYym45j9vk5U/R5EDu42UP1F/p08Ta
         DsC5Zgmd8Au+fPCUJ5sSJDkH+kuZXCTUAPV8GnEmOzM2ZL8UuxeZlFJpbJkowMnB1IjN
         2OzA==
X-Forwarded-Encrypted: i=1; AL+hErE+Aq5hMm2wTU6NUOlbHuAEHnq/+r1KJLMNioVtr3f2yasB06D0gv5ezf+0+UdLyVUGd1mV7VhoeAF1@vger.kernel.org
X-Gm-Message-State: APuU4Z/k2L8cIltnGcbcanUzDlIaR0AmWywRE9lzSz6uCePAnzWq7ydL
	HlZ8QFnooa3E6qGUaVEIwTefdRZimRsiU091Y1y8N+t57yb442LgfATf
X-Gm-Gg: AZFdTZe2q4RztSB/M8Qn3xIX6xihB1zDxMhw/xQkGGiuY90Hdvwt37zAfIaCMBpMLkH
	ocajEou3QOLpLE5D24wUQtsRaek6mvATaLLEHb6+FbYzL+nOqRYO+sQQ50r7DRUEKOqa9QrHxA/
	YsGzGVXqssN7Ju11JSa8DW3FUaVe9RuqiyXHk+EIIB3HCOLar7ZjkeTqOMR0s+YUSqtvP6RMxsV
	TIP+EIW7aYCW8pcrAT63kDhrsgpF55FB0YvjpEjkvaXRDH+PPaHTgpdV7lQHxf6UZI1coMsKyjG
	TCfcBMIwK50eD/tbkzkRMP4LBOhsW9m73dpq9eR+Uui3jF5KpIEumNHiASAUoZ3ZARHFLKsb4z3
	dTZXbWVglLxo/g//GMCG8iEfUxJXY3SI4CUHzhVnWODOIYlBIx9yIoVXpo+8MzLKAfbM7j9z+zj
	/NhPxd543kFcLvVVWIhA6LwWiknXJy+oGJaiFuwvhN/WrOYQcOrGieqD52KT6QxEM3s94t2ngTb
	/Zc49Ifz8K+MMSLFjYRhIQ9sjKtY8Zo8G5pO+L7ZSBUQsO4S1KVbITV2FodnPIVU8crN7r6yW7I
	KzUslmdy06YT7n112qCYuWKonBRGzrqwpj4=
X-Received: by 2002:a05:6000:250e:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-4aa5805e1e3mr58576532f8f.21.1795785631616;
        Fri, 27 Nov 2026 05:20:31 -0800 (PST)
Received: from gmail.com ([2a00:1bb8:11c:ad4d:e281:a398:d85b:8a2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm48315205f8f.33.2026.11.27.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:20:31 -0800 (PST)
Date: Fri, 27 Nov 2026 14:20:27 +0100
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Flemin Jose <flemin.jose@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] virtio: Add Qualcomm VirtIO transport wrapper
Message-ID: <awmAScxDZqR8GRy5@gmail.com>
References: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
 <20261126-jshekhar-qcom-virtio-dcp-v1-3-7b49bda74916@oss.qualcomm.com>
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
In-Reply-To: <20261126-jshekhar-qcom-virtio-dcp-v1-3-7b49bda74916@oss.qualcomm.com>

On Thu, Nov 26, 2026 at 11:54:01AM +0530, Jayant Shekhar wrote:
[...]
> +static int dcp_virtio_transport_suspend(struct device *dev)
> +{
[...]
> +	ret = virtio_device_freeze(&transport->mmio.vdev);
[...]
> +	ret = dcp_ipcc_enable_irq_wake(&transport->ipcc);
[...]
> +	ret = dcp_ipcc_send_power_notify(&transport->ipcc);

Hi Jayant,

I've been trying to review this patch and got a bit confused by the
.suspend implementation. Why is the notify needed here?

The rest of the code seems to imply that a power notify means "wake DCP if
needed" (e.g. "It wakes DCP during power transitions" in virtio_qcom_dcp_ipcc.c),
so how does that fit into .suspend? Does firmware treat the power notify here
differently?

[...]
> +	complete(&ipcc->power_notify_done);
> +	if (ipcc->resp_vq)
> +		vring_interrupt(0, ipcc->resp_vq);

As far as I could tell from your comments, rings from IPCC (separate from
power notify) are needed when resp queues are ready. But why if we already
have a virtio interrupt? I kind of assumed that this is what was meant in
.suspend when you enable IRQ wake, that we may need it to wake the host,
but while suspended the queues are already deleted and resp_vq is NULL?
I think this also addresses the race Sashiko reported: this seems redundant
or I don't understand this mechanism fully...

Thanks,
Stjepan
