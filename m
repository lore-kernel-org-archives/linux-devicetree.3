Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575D72494FE
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 13:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776778231; cv=none; b=XujsqzDSPauaZlRtGUkSRrH7r2aIbWT5YNtZ3j2tusBNXeqIC5W4qCTr33DBw8W6bkHsAXXuJGdcrY9WBmlAYbeB9fRsbD4waFzcWIYrDUofDmTJUoQcVt4M3UGIlxpLkA44WqqCSvf2c0SXT2+qPnm1SIvmE1qx5VFT/U9MRQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776778231; c=relaxed/simple;
	bh=3MeReQVKB6Bo6lr9R9esFaHNT1S60+0cvnst9My6N+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWvMYYY4/nTTYi26SaZ7D3HqxBWp8jJ7q3xN1roT3bzOtGAWnAyGsM7/Hyy0BDVDXagUEzVYgCc951tXxCpfKbj73AwNY37qczD/4gT4WXMQISO4/WnzAM3OEV/V76Hw9Vn+r66Hq1avfbrKtoIyAb1XAUhouIUBQLm30iUNwUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diAQQVAP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggjCAJ/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diAQQVAP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggjCAJ/6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9DWlt4167771
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 13:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YIhCcv01X0hJw39QIV6zhnXw
	a3BDMNZiyBozWH7UvxY=; b=diAQQVAPQOWr6HLVeekonwTybCTA8ysbUFeCDgbR
	yfhmHOOG1x52PMnGPD5wDSxvCRFm9YhS0tlI2INK0y/PBoHVfTslaf1PZB9qMCXJ
	y8FIqJSXGaywJT2obYsCuzIZJt+s9bxnQoePVcGD4Kb5A2n6kvib5pWd2IBq6F6q
	J0fh4aRac6i0ZdbwsxHouVMBtfzspCtqRRkFgcsKgNAn/FnhkMU8tMoU7Eip250x
	tu1jdziFWRJui1oi+/nnqt8+bLKF1c5wNjQsS5q+oi88HTR450XcbqyyPEycUTF9
	LV+DwdhfeASo3uqw88YerBFHzx2/3Yq2gG8Ij9W/pDpH2Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au24uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 13:30:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso5481354eec.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776778229; x=1777383029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YIhCcv01X0hJw39QIV6zhnXwa3BDMNZiyBozWH7UvxY=;
        b=ggjCAJ/6E88w1+Ke7ve/JHmTVLLUv86j74VzGmxUZlBvFl5XJAj0QN5PwuEJnYqlJQ
         yMNiQQc4v/8SYz3XLVeiVzwjqbDBTB6PvuI3cXsem/GinBLpDRmM2W8VhIKO1bo6ygW6
         MWI2ekumfKUXMMeNXKpJhhNunnkjj+BykO8z5yY2GuztXlqy/g8cogXmaG+y6YNp6ydp
         0bYwhOTBeJh6HzFKah8pTZS1KWgiUdPR8pbLmQrcfUkJzXfavxXNcYcfwSvTG6qNhARb
         tJlMnq54wSK4MbsRNl+D9y2K8+FRuYDy4l2PkReT+24OW7dBNNAZWxNKooc32Bvh2Xj3
         FHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776778229; x=1777383029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIhCcv01X0hJw39QIV6zhnXwa3BDMNZiyBozWH7UvxY=;
        b=mGQh+yq0KvMyPlW/78AsuyQ4zV3xObll4Bto8svWaXD7jT5eVuks5B4km83BmyMVDL
         6SAyywDOZgS7TY7f0DFGHGqQn4LHFQ0Qw1swYnaFsnk+k2cLhtQe1jX/goPbOd2+SRr2
         1QJnAwJch9bEGHYkSWkM/7JorL+0e1daRpdtXhE0iIEzzDoYp3hgE2lcx5muRlpU9zKt
         PqdMeihzg1rDRjckhcKYkVlSe1G8/BmtoP7rBg4i7xMEII3wVsFHvsBTQST1P7kLBpbq
         alOIgKJyrt1QICHHeKBx+yGakKZ9sJuN76rFyFzLaUQwnFl91gLoZ4NMy/ixcsp+0e/b
         LbcA==
X-Forwarded-Encrypted: i=1; AFNElJ8Y4i3jszvl6WJbCkx6RvbgAj/k19bgi8CHFuvmPwbe1AdN2F99ukW8GAkVjMa1PzRuCgDkeMBkooEx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ea8KKeGaKSihOlCe3xuostqFAhEHwygxiTHbOVNyeqeciiGQ
	KYIQb+j4H+pfc9XMdLsILrnLb+p0O1zDFkoCG1XpZGSc2GtL0R7P3FHQha5Tluk7xsIeoaymNXh
	Hb3ei6dcUxWPwpK/GdjrPp+wDZxCDRVzjk9Mw5ml7w8AWbD4vnao5JvhCu/a1fvVK
X-Gm-Gg: AeBDieuSRmnInXCLc/qY7zAqkldn3FMi8jBqMPKe6HBNez/vamfSXUO8TRhQEh1BdV9
	FBqym89wx5Ky90S7Eymqn3arIDHk7s2pkqdkFV00zeiwEB38E7R2DXpCvnZ+Wb0mM3PFXhgg2uV
	FoZqO/CwNNALPvK7ODDWnYbH8LJi+dLeVmW24MhAi5Jai+jUUBERpO7QsOdkTB8nm65y7+wU2+p
	tea/M3iMWXTnMMi84J8ZRdHIkoUj51xZVlQNVjm0365KyxEai6dPjUW5cRtUW658pB5NOLQGnJU
	Nmh/BJVMs+cdDcWEREZd8fGVXsUpkoAb2mkRxzSNBZj7LB0i2BiVrHdPefXmdwZDoOMDOS0wgU9
	6e8O8YCiuVwyq7ne3WmNmd6NyKFD00RCJrtob8sm+3aWnjSbz+y8sMtNpodnO8iDOWHI/z8J7uJ
	I=
X-Received: by 2002:a05:7301:168a:b0:2d6:78af:ef5f with SMTP id 5a478bee46e88-2e464ea6ee1mr8498924eec.3.1776778228416;
        Tue, 21 Apr 2026 06:30:28 -0700 (PDT)
X-Received: by 2002:a05:7301:168a:b0:2d6:78af:ef5f with SMTP id 5a478bee46e88-2e464ea6ee1mr8498884eec.3.1776778227597;
        Tue, 21 Apr 2026 06:30:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8b3dd9sm18840783eec.27.2026.04.21.06.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:30:27 -0700 (PDT)
Date: Tue, 21 Apr 2026 21:30:21 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document
 Nord QMP UFS PHY
Message-ID: <aed77cSNTF87y8IX@QCOM-aGQu4IUr3Y>
References: <20260420074942.1250414-1-shengchao.guo@oss.qualcomm.com>
 <faa58e87-fb6f-4598-bfc4-b48b93bd0400@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <faa58e87-fb6f-4598-bfc4-b48b93bd0400@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEzNSBTYWx0ZWRfX9mxKF+MUF2YN
 Y2xuxkrDlJiUjLzC2chsZT0XI0/7NonC/GO0zGhDasQNNUbpvnWi7+eTUrwO4sj1LTwFkVme3M8
 1YQsLwNORxvLoHkKR5VpHo0qVE3Qe1GmT3mEt0MuKScpHwAMKK6Roqb2fsrH0NGyB2gAiHwdJWD
 kmTSojPIuJzxcK/aLyhzHaH6ulayQORI+uiMadh1XmCCkmMXccTRbGEGB0RW+E1Y7h2e173Tane
 2ecr/NYne/apiIP7BIEY/hORe/PRoJTL0AX85Zxoq/94AJwvyZf/fcmL78008ElBEc3w2O5pN56
 iJeq6oib2sp1E/H1ERg0QBtEePGXe+qcX4dtoeRVsXCk7QmSDeAWbCYo1ljm8SnoqEDTDhVO/Kj
 5QAXhriWjO8o5C/sa5WcDcVWvpPmpti7HCxS3ZtgMxcxz0zoKNwfW42IIwyAwsAxZuztNoQ8ekp
 gK/w7d/CYEtlsjMIUyA==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e77bf5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=upPKRX-Ir4GeM2YDT2AA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: nOxcwfRYWngEbuZtTldNtJcOS8jzVpWt
X-Proofpoint-ORIG-GUID: nOxcwfRYWngEbuZtTldNtJcOS8jzVpWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210135

On Mon, Apr 20, 2026 at 10:21:39AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2026 09:49, Shawn Guo wrote:
> > Add compatible for QMP UFS PHY on Qualcomm Nord SoC with a fallback
> > on qcom,sm8650-qmp-ufs-phy.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> > index 9616c736b6d4..cc3457d6aa3b 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> > @@ -36,6 +36,10 @@ properties:
> >            - enum:
> >                - qcom,kaanapali-qmp-ufs-phy
> >            - const: qcom,sm8750-qmp-ufs-phy
> > +      - items:
> > +          - enum:
> > +              - qcom,nord-qmp-ufs-phy
> > +          - const: qcom,sm8650-qmp-ufs-phy
> 
> You do not need new entry, especially placed in incorrect order. Sort it
> and then you will see that you just duplicated it.

Indeed!  I missed that.  Thanks Krzysztof!

Shawn
