Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530274;
	b=Q46dSim5yb+Udq3/2H/aXavrCqDLw+duMjtU6ZgseGQOO/Bbom4z2iwqPNRXZDqH0dMY
	 p6/dfHKaPPsbYaZxlxzJlTd5MzGORQ0dC8/WLW521t+pNBBOZacgAflF8Y2JG+24/6XPa
	 LHSrTQ3po1N0VMC8v5vuTTb2rtB0/poay3Oa1Npek38ypRUWwzRZkL7GbTY3WrqEDhEmO
	 T1OZ4Xwk1/udgRj5ub//PlVjZCTb2Q6B9sTTcC9tVeC+MTY6t4e3NAIoJqQN8NPGusGL4
	 h6N4XKJYcMDme0QN8vD1luhsteyiY2c6g56Y7zkEVrEHBAXaxXU3+kt+OA3L6HQqNBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FzODplEKs+WHcm/+4H/RVQkgIn8A4rJ2dXxs9VQSrPA=;
	b=bj3rZmQwsHwFP2Y/SWXKWHxrZwasypvY05wog1G2ccUFzW/OtdjHldVl2ZBW28LPf3FS
	 9dA21mbDUKlRdiZkko4/53xfKDwilFxxruYdbUH/7g7cZKLi8N1MztbKcIjXJvz8BlqIg
	 L81jY0e6Kp/t6QgKSiiWUPEjMMXcPBe60npAInKsfVvgs5lpDRfaDbLK5KFy6ssjWdza+
	 a60ePIjwelBPr6PmYuAQjSYEapW6hO69+3cAtyBOiMyv8bnWQ5M8ggvUhC0YA/2Zg6umC
	 9FbZJ5DZM8uojG+VMGV+N8F0iRsaKVRDPtQMlTKihkTAr+FKS6+uy4CAAnby4dtaHmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sxk7TyAf;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543FF606A33A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 543FF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sxk7TyAf
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4919a880834so158677f8f.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530273; x=1795135073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FzODplEKs+WHcm/+4H/RVQkgIn8A4rJ2dXxs9VQSrPA=;
        b=Sxk7TyAfvprMUBLPfRxZq8aZbkD3Mu/r/W0AmKA18WTgowz1bzDUXazJ3H7HFiqiXk
         rJnBD58mhnP5pAz8goQBww+UHY3mmCQZ6AfWtx3SJcMKa6bvp6E3y9MPYrJEoKpvAvwu
         xL0f80PeJ4D6g2XPV5kY4UuEqIW2o8LPhhEfFpfSvVkxLEJZ6+OsSrzi2zvNzdbh1cr8
         fzmmLwjPSWSvzNwfc/RTBNHYETaPI+gS7kBhuR2ZSSE5ot9pANyrhLrY80ekUNW1kjE6
         k/a3tmxzWHTCOK5iBCwb6ATelKk8w1dEQxNS6XwxmWKgIKJGWoSf957/ETiAO/hEVGvC
         jL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530273; x=1795135073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FzODplEKs+WHcm/+4H/RVQkgIn8A4rJ2dXxs9VQSrPA=;
        b=YHVLTOdGbfzGxZLI6YvShtKFK+IXSLee6fHWU8s5jRjYhescMwnLFIIxTTpe6tbSzC
         8zYLjSKBr1Ocx2wYl+nMPcdiJvyCGa4/f+be3qPtEmC9hZPfAkQKJs9FEI+LA3sv2FzS
         qDrIFzQWnHv+G5PPEccW8GU74mE513m0gJpk7Ks6bD/nxLDvRJshjVY6rQCtkhUo/SHO
         XTZHIIyOpUoHqjnrp1qkfwESOwhLBn12FIB2tRJTpVU/dHFXbV5qKpKcmuLw1S9g4gfH
         PxXT/SXPkynSCbthRV2eGwfkN9q+sAqADdDAxlCsswh1GtiykofdFBwAR3cFYzB75las
         X6Ug==
X-Forwarded-Encrypted: i=1; AL+hErES/BE7uGeNkevDLbQC+AnC5Z9gZleDDw7zyH8gSK9FhH2ssJt0UlovbTp5RJrodmJpirdUUsdpzFUN@vger.kernel.org
X-Gm-Message-State: APuU4Z+jaKbQM6Z2t+GJDn3/whQ+IaR2eWPEXjY7NjvKaUyssTGMJc7e
	Q9U4MNXMdgtSfUZl4guG+1ExqtlWpOuZyFnLPLSoqumsVQRM1/KwUXmd
X-Gm-Gg: AYBFou3PhwDF2rGvtZfUmwOyG7iKVWjFK3euUJlLiRl4aVmQIhiMLnBzxgohIHDQxrj
	5TLfx/Ev782sryVRXMoG9vFNpZLpruurFiZVKSGpoCP91tXaZyZpxoOFUSF5cl03Y5UHvL3AFs1
	8RPdmLzv8swPsCQOtdx6mdl9BVUcxsG0SfQpe/R6XuQHSfFg6ujkVTgisyprCjhRgWbuONavhK5
	pP6wMItwnziRd8lD6C9BiMSTLAF4QORbaCnai6NAJgsoiX++JuYDIyJGYH6n5Q7/KHfDve3x8qO
	/VvQrGUzg6jxLbgoONlEHfkmm2QVr+8DDzlq2HW+GrNGvQ5oto987AqOUZ3TN9q3hr13jhJJRuP
	PlGh965zAb7j08lJW0a23LhsEn8XCMdeG4d/2YH3F8HnX0LhpCiqbxhD5At8e6kB72qhGPSTwbG
	h+OKzGD6Vq8DZcXEYU/bOf5NQL0n7CNuseQOAQVvtI4BbgOU3RILwdv11NjIMCQKcGHysyaTaFq
	v7I3nv8wydBhZ8VM8N2yQeWHzS99o2Mc2e4/Gom5Go/mUb1NIPbuGoJxFSKQL1mQmsnkBkuGRZL
	VidohBke0BwIzQeohrXvjZ9yKGKxdfDbghunmrLeEfKyzzwMwf8OieshR+6SfDxOEzdtoGPd0L7
	4oj1qEBZXeaIsyEiJRMPQQsMFlrdHjZED9AIecvTli9I4YtHsKXmpeG8mfD+DuDCzDGmHyMLOwK
	casqZM6lTGZfBA/fCConOjOEZZHHGjBpMfx8kHyXo=
X-Received: by 2002:a5d:584c:0:b0:493:c0a:5087 with SMTP id ffacd0b85a97d-49c72e85557mr2540807f8f.51.1794530272663;
        Thu, 12 Nov 2026 16:37:52 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm1741922f8f.19.2026.11.12.16.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:51 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/24] dt-bindings: PCI: Add ZTE ZX279128S host controller
Date: Fri, 13 Nov 2026 00:37:50 +0000
Message-ID: <20261113003750.3668725-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027214010.GA1212169-robh@kernel.org>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-13-ghahramani.navid@gmail.com> <20261027214010.GA1212169-robh@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rob,

Rob Herring wrote:
> Drop. No point in -names for 1 entry.

I will drop clock-names, reset-names and phy-names in the PCIe series.

> Is this for PERST#? If so, make that clear.

I think so. Both slots share one GPIO, and the driver holds it asserted
for 100 ms and releases it before the links come up. I have no
schematic to confirm that it really goes to the PERST# pins, so I will
check that before I call it PERST# in the binding.

Best regards,
Navid
