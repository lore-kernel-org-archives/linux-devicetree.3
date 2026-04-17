Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD49199D8;
	Fri, 17 Apr 2026 03:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776395213; cv=none; b=b24t1Bgx5kSVzUItY9b3ZReAOUUXMX6T5c+Sl0c/V8wEYG72d8BWyz+6R+9marH+T5qFmurfdn/6CA6Y9CuLltJBazXzw7Mtntk1gwydZLcGybNrxO46HaOYzZEN6vzof5Q/sLC+KsX7qU5QVendbhavcW1rmLDX/H5/aWd7Y/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776395213; c=relaxed/simple;
	bh=3iz3+mce87bxCmIkA4vvBp+1Koxccln/RS3eewLmjsw=;
	h=From:Date:Message-ID:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QTQHQWKQj0RKm9wlxKl2o/ds9YSm46HmpIlpVthsAOaxjkVSlF8tvR3dpOedWTkAAjKtitIm5eXAh0U1BFF7wQS2mBpS2A3zl3+ym6Tqd8qFbReHUR6Ko+k1z6gkQ5O4iAdHUhtH69pObtjQ+ikQrr6fZtWtzhQ8QDK6wCTN+UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0003-drivers-of-live-tree-reply.eml (unknown [111.196.245.116])
	by APP-03 (Coremail) with SMTP id rQCowAAnC+LBo+FpPbhVDg--.51927S2;
	Fri, 17 Apr 2026 11:06:41 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 17 Apr 2026 11:06:41 +0800
Message-ID: <20260417190003.3-drivers-of-live-tree-reply-pengpeng@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: Re: [PATCH 1/2] drivers/of: validate live-tree string properties before string use
In-Reply-To: <20260403183501.1-drivers-of-live-tree-pengpeng@iscas.ac.cn>
References: <20260403183501.1-drivers-of-live-tree-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAnC+LBo+FpPbhVDg--.51927S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY27AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87
	Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF
	04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUAVWUtwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x0JU9189UUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Hi Rob,

Thanks, I'll respin this.

I'll switch the `device_type` match to `of_property_match_string()`,
rework `of_prop_next_string()` so the `cur == NULL` case flows through a
cleaner iterator path without validating each returned string twice, and
add a unittest for that first-iteration case.

Thanks,
Pengpeng


