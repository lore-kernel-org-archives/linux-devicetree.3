Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5B27081F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495727; cv=none; b=XcaR3Dhk5ZOzJ0Wce1Bxc43c+/2c8QgKeHx6KUnV+8ygpysdSff8DoriSuN4nORpQBRF+twa0qFLB1aSQzGCtQWT4FZqMY4UnW1mB502DlmgivR00hjIgsA1BiWq/1ModOBUDb9SMBmXWYUhNN8lba6cvyrrkzt/wNxKlppgx0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495727; c=relaxed/simple;
	bh=L15k8u3orIgT0R6SYaW0sHn7giGstxi9IUpykbO6UXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4PWpXUlrgcRUVToMl5E9MGKj8jd3Pzyfg3tzE7NkxWy+QoxMeqw8WgYIWztGXuRZfsH0xas/jXF7/y1ayxaxpDLssxXa6pLyusBg1S7rn3LNTAnjHvHYAY+8yHgUusdJ6eStbfCcR7pLjwtkSEDb37+u3lSdAP9HmB8VlK7TG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBqZaOn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMHa9Zzm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBqZaOn1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMHa9Zzm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1i2oQ2727896
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V5iYWamYBGi2g8X7XD8Ib5OY
	dq2ngK3owfPK32tRL48=; b=PBqZaOn1Mm3Oh21rL2hiBioLYSupkG3cmm4KUfYe
	mxmuJm7Fm5A19YvPHu6zLwEKJVGvRvSCgGVeYdo/NBzXqDM3lYkRzU9tF9JEtaNJ
	5VTXoNHPQaceMTusIrT+dc2hdQJ1FTvHfiQEW+Np3V/D+/HcwhCClYB+idhK6CwA
	+vTGh3weu/DDo7VhLdLaxAhsHhWz4MNWJYwJ8f9R76jmz9QKqVkm+guTftMjK3kC
	6yATU0P5UCM827/3ekTbic95ipQZMw+IxZN5jLtjdq2QM1jsdst/ewu2rCWLK7og
	cgB4+/mjT7mWnD1gOPKDfSwSBUiBrJZwVaE5Knt1jvrv+w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye15e73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:55:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8620ee0971so3111682a12.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 20:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781495725; x=1782100525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V5iYWamYBGi2g8X7XD8Ib5OYdq2ngK3owfPK32tRL48=;
        b=AMHa9Zzm9A5ymAgh5yxiVeY/6sSOiywDTHAhC/qtVPophLSr98dSRoAtEM2Bqg4BwN
         rcTvHLBaObZsjMRuDrtdxZ53nnvRiM5jTySmRisyeO6E9dWE6uhItkUlgOSqu/7mzTg5
         S5LF6Nqy4gak25iEDeHkAQcJp5O+jRveDVhWeRvdXofloEW8G7qpjeRXbmzg2Wkw5leU
         AHuNxBXIGYiqhjUynlKUPY7tB+FDOjZo2vt65Zs+setmMfDaTsyx7KXqbIS3C8BMmlv3
         1RwF2tb0sitQi7vS7/W5/AvIjpDnmyGwTLkb6N5hzkX5kTmwewNIcCsvGtlYQxJwTjJ9
         37jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781495725; x=1782100525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5iYWamYBGi2g8X7XD8Ib5OYdq2ngK3owfPK32tRL48=;
        b=FAUhBSZiOKT+BzOWcmfwvi72ZSozUbzAs8P9d0c+bTALfbhRiSYXNM3llTl9xo61bi
         ad42mQcO0cvzPsnWPb7KU2NgSwwgX1/fKRTz+H5Sp9ky39RmYn4Q6fAorVB9rtqbMe4P
         zHN3FZHAweWtyDnEkLrkN1Lgb2CmMZ/cC8HoN6MYvR55VHCi2eykgDuON7fN2hD121IP
         yHRug1umwtfaO5hBPAcJ2N0zMVSUiI2LnNY5zfCdXc3FKwj7xKGARYTx3lm6sgp8+44a
         MTqEKEJoaQXFBFVSIUdlTmKWBfkPpvSPiYPd2j/5khhT24xYmqlSK1OA9XBK3Rocazg0
         2C/w==
X-Forwarded-Encrypted: i=1; AFNElJ/CfDZIFYd98JIKDdbBeqnJWREYMtacVloqVT6DEFuD3bTkwf0vtLkZ64Xgv/MnGh+I00UzpU9U8FPl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3TWhqKklennPO6UA6BgFcs0UwXZWYIke4y2V85Z8pAy5LfuO7
	9dqZyxvJ3Tue7ZjQo0J/WdjoLkDsWDWL7azDbHaQh1qj0CTXb0C5lIyeYj5/NvurlPEDJaHTCz/
	TGndj7xW1VnnvVRB7yQhU+n4F0PcXBn9eYm/KWmTHlmfItU+TRO/WCE2doQsjZ4W3
X-Gm-Gg: Acq92OGISGCOLPNEAhGTPjNo11SvY+BLnwpu6v3/JAyrwHr5tbvJrYDws2X3zJRPWIz
	R8R9nAO3/jfMuJZaf2UnjqgIJ6k3052BZ5vOwDiThgwVzPTaJrJht+HKen5cvdCigECHIKpEASL
	BSxuc2ZY6cOrZGub8IBb0LQw2rkrCAZLGoaGVeG6hFSMSp0YDNVLw9o+WxXYDRzONPbC/XMk+j3
	dVufvE9RmsLJ3lAgw8xNb1iF/fMAKId77rPrsoPP2RzJKwc4ZVRrwR06vXwc3xmxODmO6K8ziFw
	ntymhPNYUJLx3S9VkSGGyFK6K3yqhjWnqTAeqK0eYqyzlxuRjQk91ufTCI1P/X5+bfESZ2VZVPJ
	CByaO5kyWUKHdaViFO58Num7jqvkyPFLDcwQ=
X-Received: by 2002:a05:6a00:23c5:b0:842:6004:3fbe with SMTP id d2e1a72fcca58-844e1a28e6fmr10448197b3a.25.1781495725008;
        Sun, 14 Jun 2026 20:55:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c5:b0:842:6004:3fbe with SMTP id d2e1a72fcca58-844e1a28e6fmr10448182b3a.25.1781495724608;
        Sun, 14 Jun 2026 20:55:24 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b05921bsm8482573b3a.59.2026.06.14.20.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 20:55:24 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:25:16 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 7/9] arm64: dts: qcom: shikra-cqm-evk: Enable
 ethernet0
Message-ID: <ai93pMA6MQ2zBv6q@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-7-f0f4a1d19929@oss.qualcomm.com>
 <6fde35ce-52dd-4679-9952-728b6553b843@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fde35ce-52dd-4679-9952-728b6553b843@lunn.ch>
X-Proofpoint-GUID: vDbLlfspLmdkomo871kA-LXwN82W4vBZ
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2f77ad cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=HuS8l_LH735D3i-wPbwA:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfXzXcAU6t6pusE
 6tqL7V1vt3mWeSnHoqwezw1qRsF+NOh7jtg98B+nA4Nr+WMSkHK5gFjMiF47+ft62DsnzZDH2Tg
 F9cqYgJuQw7p7lPTKqtykkW9T5fkkF4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfX4SKSenBugQNM
 JLecl8AkPNuY7II0pcL5+Wq28ERDp4fqlIU+vKnPPNitMVy8y7O8CA0ueMUiLAAXvmr2pBd89oc
 He7O969YBKKKVU0j5yh3k8ZaeEykLWq3+BdCxznhR5Biwlt60xdpEUD/e1n75AgJgGlbWnN3Bom
 wXr8SU6APhVh3xGD234fAqpADMEnswVSp9Z81HIxHZ811/SJX0LgbLedoxlLTHYNQwyEGM8XR9x
 996j4Kh1n/YG3QOxjgyS4BdR116rUJulfXgsYnXY0XAGJEqU4bmvQQkawJ6KEtNiNwo8XWtRI1O
 sfjDDFEaFCWqG/9hubUxFoKvwOuCmRP83epbgWForHYz56u5kb9m6hgf0gEbU9qAWRUxAXZ9xrN
 jzWXIJj9/BPHmXC1qKhG5gK9PbVhKhBiwIHB3wWu5sQXK9FRJ4WwYo7qxjUKzQEF25a+r5uQY8B
 vY3xfN0rlX0OlGKpaVQ==
X-Proofpoint-ORIG-GUID: vDbLlfspLmdkomo871kA-LXwN82W4vBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150037

On Thu, Jun 11, 2026 at 10:58:39PM +0200, Andrew Lunn wrote:
> > +		ethphy0: ethernet-phy@7 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <7>;
> > +			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us = <10000>;
> > +			reset-deassert-us = <50000>;
> > +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> > +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> 
> Are these two needed? It should default to 2ns, since that is what the
> RGMII standard says the delay should be.
> 
That is true, I will remove these in v2.

	Ayaan
