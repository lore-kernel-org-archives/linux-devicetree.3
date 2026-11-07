Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017528;
	b=bvCT4Be+F2yxCiZZBE2YWvY1K+Cc0Qd+K8aphRfyfWOojFF9rKLfIoWZiFHutRBxBx4p
	 nlTOeyVOp2wAKH/D0TnwhP+z5C7ic+tKhKjbTv9DGc5T+NE1vxUR01k+71jo6i+vwHOmr
	 lnZontmPQgOJY+j//+sJN5x44EieIAp2h+9cEqQGqtPW63A8ICS0qO/YnvYCbu3PuVXeK
	 C+Tivq1w3+aGmlntv+5vgtYR+TeIoHeOirYWWxaIMp5GoLEeNefxBT4yfcmoPVEJzIB4a
	 X6VYoQOlence+R143N7YbITkt5vGcmmXRpQE3Vn19WG6PKub7oU23NMxSu8d9kwK5AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LqQCtL7DY6GdOgcgju6Yk99vFFUh6YCcWxgQrEusl0c=;
	b=r0wUOjqbjXP1YhD8xlgShLMH2ncJ7TbM6FNaaSiSroAgkQwHOdyVLlTcP7XCgwzXfEAL
	 UdJ4Dh5+47chyGjziZ6TOy3g5b6zedD0Z/jhaf4c/RDJMBHePOp0nk2ori13o550on2w0
	 pctqo9lUFhzXc0anfhpLBqeGmKXrJ095wh0Z5o2YjSsL8gqyC5tjFqjw9G0UWMpX+Z6Ao
	 kAfAQdTOvzj4x+KY2mXa32IIMmk6w+NL94OPK9yXf/1/+qcsq/bU0Ll0liM8rrn7c7Umo
	 0n2iV0wKgTqjmCAaBBSrKcMc+JuLxShVtbDmbJdsUz1gVYMf4qKU3/MgG15a/blM3EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WN40mK77;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B980606A32D
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 02:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B980606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WN40mK77
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36cad25b8b0so2013103eec.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017527; x=1794622327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LqQCtL7DY6GdOgcgju6Yk99vFFUh6YCcWxgQrEusl0c=;
        b=WN40mK77q2MS0NRynvOXOkwBOhjMjS8o5blvaF59gy/8znq9HbxNHxZsG2N1FwWOAO
         pTAuQRf4j6rhw3fT56835TqbRRFGlf/OQ3XNQZH/24t0RcQ8PVTrF64PbPQ1y3uhItZS
         0AIFwC+b6KLahtXWBc/L05PucbM1u78pW1i9Z/K6mqbGrDf5V41efbftNnhbCqtO58zk
         k/1bSUUBNsdi0Vp5tTaO57CUdgE29Uu6dA/R+TbEbxV5nQ4DpIrV2buafwtFjBoOUH8g
         syYT0OEWfsXI/cMn9aePHWmEpAeIyyTaImStZlRs0dwx0NklaqtHGIkst0IwuM8aMobz
         tGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017527; x=1794622327;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqQCtL7DY6GdOgcgju6Yk99vFFUh6YCcWxgQrEusl0c=;
        b=jdHlCEolofHj8+6eyM0xySF19DIpYWITNVou//Rk9NhcZIdHgZIkCvOrW4ZWtIH5oR
         nd0ZOCAL8qzwIVyxwJiOHD/4Orv2Z9Ykc2h72G6810ng39xRDMtbvCInLIm8P5Er0xRc
         LbP9Ko+YrxcGYZb840TcwcfuwYBPyLXYAHEYbEqyWKACKSF/YBgn98QQxCR4mFSZ9kri
         nXujUOZhaXxIcvq6pItmS8qQL0fzdMiIb3VQBhVCO9RAoQSiyzZjvo7z53dLJ5XW9aHU
         S3tPF+SoOu7pr5S3M7ubmniGB/l41azoGixJvsUOLJI2T3XxaoiEhXubnE0aol4mC3Ok
         WgJg==
X-Forwarded-Encrypted: i=1; AKwUvBzXy7ocBf+M2K+UWOKwmCuYw5Q5Wd7UPB/3nKYyolEvnCeltzBVUcvQ0wf+r7APBTav+vIPHSzEkQT0@vger.kernel.org
X-Gm-Message-State: APuU4Z+r5mkuX2gsouKvzg0z6sZpyCooZABoW3urVpTjEm1rEn2mnSHC
	6SFkb+gNlPyNX0pT7R8DVVM+aMId0yH0yv8Y+ZAaPWr3SiKCutPNQ1pW
X-Gm-Gg: AYBFou05LWT4CGldxbu1dLkT1dOy5Pqryji6gzpnqEMZTd7kCLtZfqpK4ohwDaHGdZD
	sGNJYhjYKp05bGqFq1Zp7pnAJ6QvROS/25pVJzg84mzAKwpwsxn+0gB8vlDRAdv5bDpPARXGFdP
	YNd6+CvunnbwrtABhS/anx5dGiG4fwhEsUuI3igRwljiqQMTSRSgn/jgy2QB3Uox1jcHRVWIdZ0
	NEvGUWpoo9gm3oib/zZlvFJQ/Y40AgSCRRuyyMy1Yy4GyfeePZEpk8+UBFV8sS+nZqWWVA1FW/g
	k1soeK+X//ZAwkWi623xlyZzYiMyNsii8pSChbbcIpwjc7lb8LHZYbXOD8X+ePQ9CvDB/F3NBC8
	JrpULy+DwY17YiQ1hbOvKfHQlVth7h9CziGenG2ZoluKX2/lK87Btd+y+AvUkDgFarQ+OWv+uOr
	CZWDmvG9tpf9p5TECOG5yufL+IWbKvwCcqJ7TxLG/R0zIgqorqt/HC8NtcCTK7y7YrHbHKlV0XV
	VFwN7SJAwrXJ/JFm03NJx2r2eXzIF0ak16W/hc5JXiV0dDsk5l5GUE+iNeeLyQVD+ljGNKfTjbA
	6vpenw12ouZ8BdWWc8bJLDyLYohujP2gfe7YRdMoEgPQ
X-Received: by 2002:a05:7301:b0c:b0:36d:c3db:9802 with SMTP id 5a478bee46e88-36f76023a2cmr5537963eec.18.1794017527249;
        Fri, 06 Nov 2026 18:12:07 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9be7077sm10949924eec.17.2026.11.06.18.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:12:06 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Sat,  7 Nov 2026 11:12:08 +0900
Message-ID: <20261107021208.934-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261104-bipedal-supportive-earwig-2aae26@quoll>
References: <20261103135057.1682-1-26rote@gmail.com> <20261103135057.1682-2-26rote@gmail.com> <20261104-bipedal-supportive-earwig-2aae26@quoll>
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

On Wed, Nov 04, 2026 at 02:13:21PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 10:50:55PM +0900, Joonhoe Kim wrote:
> > The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
> > DisplayPort pin assignment gives it all four lanes for DisplayPort,
> > while the controller can keep running its USB 2.0 port. The controller
> > has to move to the UTMI clock before that happens, so it needs the
> > Type-C mux state as well. fwnode_typec_mux_get() only matches graph
>
> Controller does not perform the switch, does it?

No, it does not route any signals. It only needs to know the mode: in
pin assignments C and E it selects the UTMI clock as its PIPE clock
before the PHY stops the PIPE clock.

usb-switch.yaml describes mode-switch as "Possible handler of altmode
switching". The WCD939x codec uses it in a similar way: its mux
callback only reports the audio accessory mode to its headset
detection. The codec nodes in sm8650-qrd.dts and sm8750-mtp.dts have
mode-switch.

> > nodes that have the "mode-switch" property, so allow it on the
> > controller node.
>
> So judging by this, you would need to fix fwnode_typec_mux_get() or
> opther driver code, not the binding?

The binding is needed because typec_mux_match() checks this property
before the mux driver has probed (see the comment in typec_mux_match(),
drivers/usb/typec/mux.c). Without that check, any graph neighbour that
is not a mux would make fwnode_typec_mux_get() return -EPROBE_DEFER
forever.

Apple and Rockchip handle this in the PHY driver, because there the PHY
driver can reach the controller-side USB3 control (the Apple PIPE
handler, the Rockchip USB GRF). On Qualcomm the clock
select is in the dwc3 glue (QSCRATCH), so the alternative would be a new
interface for the QMP PHY to notify the controller. I found no existing
one. It would have one advantage: the PHY knows when it actually
switches. I can try that if you prefer it.

> > +  mode-switch: true
>
> Drop, but you might explicitly disallow orientation and retimer, if
> entire solution stays after review.

OK. v3 will keep the usb-switch.yaml reference, drop this line and set
orientation-switch and retimer-switch to false.

Thanks,
Joonhoe Kim
