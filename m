Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899005;
	b=HFBFfQXz9aGA8LOiNXyRjCurEO90sGDOu1A9GDP/hrh81RIyyFALMTXMcrnI9sA5TzCC
	 FSBndP0edgfpx1GBG0ASIxxDp8TnLt/olidSEisTNZtAn6VD1UEYgMHFFqSlSXSwOCULC
	 7Y/AW4C7kuqlspdxWfKtKhg5sZObMTm6R95uHOTCJnSlDN14zdF7GcPpzvr0vtRHJZhLA
	 a7+Yl4n0iUEI1zw0rJ0bFqvlT0nQnCZSJJl7519le3miYMRzGTdZAMqxyDY7Yx96/PDNf
	 GTmaXN9thJwohksGWbJy25VqqgsiOekeEMLZ2Aq0ozqAFXF3g5/rkLZY6oI5BWs9FFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lBwQtKsaWDkw06NQG+ONWSv2LveE3CT9fBPJlpwloXo=;
	b=rf6Ayzew8F9cANJuXRCQ5eHkXiiv78lZerhFxzsn9SGcmteLdNECgdIigsExUMBhUYfu
	 61FkQD3DQYmgpmoK+q8o4X5rjWB1U4IPgpcCC2Bjp77Mo8l5dchOGsiDDvx+zxIeSTgsE
	 Bt6H2AItiIF371uLvneMMju0bXEc6bPX6+jJ3uPPmIynN8WeYKvlqP7Kk92ovES1dAbBM
	 lYNNW8Po/EyJOcvA7SLBxGvty9lyOK41Jfwo84vx4g0XKQab/BXyCK8t6YNKeOotYWq61
	 PdZU0lK+pXZQFSc2uSdZFMej6yXQGTzYCm9n52zVGZ+ZTeBLsT7Hg8LGcQLNbdGqf1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YOfgiqYX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q3h38kFL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A838606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A838606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YOfgiqYX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q3h38kFL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aXnx4146979
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lBwQtKsaWDkw06NQG+ONWSv2
	LveE3CT9fBPJlpwloXo=; b=YOfgiqYX2aKuJDkVKIDfbOa1ABub0VL951BIfu5K
	a7zBtsdygFyn49hTn6Wja2iMQ9XFDLBdJXUO+H5c0k7qkw2mW/qGNYyo2XUVSFcU
	zBEDVv/TKQYNXqGUkan0yzzQa7hluVC3v1pM9hfQ1Ufu0ncJB1B4V/TVZHyaJFVz
	pjcexW15AhzALuUjKE/hqSrPFay+MFn/8nfKn8eq5YCyrG9pBaxz9AHOawGAl0cp
	XCjryMi1G5URPMu4bTPVh8FKu8ZjQH5DbjUFUjsxZ5Ts9k9DBWgb78YB3CH8YE9I
	nYuyVVCc4TM3D1RjOGJVB+LfusFEXe9aTildqnlDSlOmyA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfm75q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:03:23 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-85f37d25fa3so5007160a34.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794899003; x=1795503803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lBwQtKsaWDkw06NQG+ONWSv2LveE3CT9fBPJlpwloXo=;
        b=Q3h38kFLb7tgsSHzmvkmDPezrBMHJyfeOag+oUqD4JKyBMIqNKviAZXHmh4CmukBUH
         gVjOnasYOlDPefsp+MEA9UegMnKIIJLQ1x3StuhRq9EPlUu2JJXzcX+gL5MiwTV22BzO
         IuYWKDbMYiyrMGrkW85w1eIt5Y3L6XAb00UEqfnLS1bJGbBLh7Zt14sR728mhu6zsTxP
         0dOklm4Q4CtLlAullhySd2yMOCXP33bDG6B/w4rywDZ00BlpuognTLDdByELjcu6KcSy
         BSOvLOKK7ga08cHaw5rg12axZLLvh0goN3WaSLD+jqkMf5CD8nGpmUjvJFdfSYpA+RPY
         5b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794899003; x=1795503803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBwQtKsaWDkw06NQG+ONWSv2LveE3CT9fBPJlpwloXo=;
        b=OSOxB9bEkbLwYPlFsux9fDFAo4lSKAgdqylnTS+oac0FcX1Z/qb6x1CgvPtj/qxiWi
         aypIlXj3N6bcAYt+fyGOgowv45bOogFl1kmSXkpwfcbg5n39gctnDjxoC7O69PEiGD0l
         8tHulrjXYB4qD2bBfTQWtlLWSpvE1QG6vEZKOvP8K8BdjzAKUAqst11ozV//wAE+xraL
         QX1Uh+uAn5FVOxWLvYk4AbY2ARvbEQVNq5ngkLGCwfijsy9DLuvkanuf8tpdfwOdPCu/
         Jz2QDvd1g7lrXltI4QfHc9JsZyMVIAFtjV1hpE2ovoe6I+p3HimX7lF3nfMW0mMUSzqN
         h64w==
X-Forwarded-Encrypted: i=1; AL+hErFhvx7WHj13kkEyhGkbZGRMzMfwrDZrboNHZZuruSWejFrtZ9QnrS3E+/ANXPQPISJCAsjBjfXZljqT@vger.kernel.org
X-Gm-Message-State: APuU4Z8h6cCwaE3JLtQNJSoj6f/83GYCQCzDpdiq1+J2uCQnO1NA3YqN
	w90xV7hytrfjLauf+67kIPWuIfAR0qjSfMMezLa991jxiOo+jT4bRmrPw9djurrC9cTMpe+1gBg
	7eBuOk6FgjNaEh2A3b6kH4jLddMwb19cTnIONUsnb+WJEDBnmmnHilWwk6m+64cVm
X-Gm-Gg: AYBFou3oYNXXEvMusz0fD1A7HPgnn/howAePHsZH9MQxbHCOGTBPeDM5cYSH8lrDbVo
	QkNy404NjPdFwxpo1zlV24nYyM4jiGYQwlLI+lvdbzd4PYkq0ytj2eUTBq67tUGlf0b6x2P8n/K
	SM97W7xQp6X8IKH9RZtE38pXs4KoNAOa5IfIdOU06HKyc4SNM2bIxlDVVUWeJYKrNj6xKhbaGPw
	mfNRe94VeNwj704H2ovRsaB1oOrOK+eVO65omms5hGuwZCTUI8M4CEwuGevvOMthjwUugtiZQN9
	urfelPk0sQtgXoyRXtaDKOh03nRxFkbOKFZKXqHCDoS+DARI60yKy0CvPv5Z9M0KE3JtcNKBJs7
	ihYNuZ5+Jx0HsQ3/L40w0K//c9TyzVMsSnW9eWdgWBSLxJx8H+LN6KZidkhrfGZ6a9ynUmmwnTl
	yu0BD4buCq/0EzH/4Eahj7
X-Received: by 2002:a05:6830:4c16:b0:862:af57:790 with SMTP id 46e09a7af769-862af57495emr9530814a34.16.1794899003008;
        Mon, 16 Nov 2026 23:03:23 -0800 (PST)
X-Received: by 2002:a05:6830:4c16:b0:862:af57:790 with SMTP id 46e09a7af769-862af57495emr9530792a34.16.1794899002579;
        Mon, 16 Nov 2026 23:03:22 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862a82c4625sm8601782a34.22.2026.11.16.23.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:03:21 -0800 (PST)
Date: Mon, 16 Nov 2026 23:03:19 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] phy: qcom: qmp-pcie: Add qref and refgen
 regulator vote for QCS8300 and SA8775p PHY
Message-ID: <avv8Nx/ikeIML9DE@hu-qianyu-lv.qualcomm.com>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
 <ded7f87c-74d5-423f-acd9-efa83a472c2b@oss.qualcomm.com>
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
In-Reply-To: <ded7f87c-74d5-423f-acd9-efa83a472c2b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afbfc3b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ddo9B1qCPzyyS7SsBnQA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfX809kh7kTmbWm
 KV96x2tAbas3d1OBEnJ4uR4YjSnNsQmwuOQTEGmEjQhmjwranAs6v0agQHx7caOsLF4e3u/dNFQ
 ujZRvJ2q9vo0p2HHJitsEfD1VoV8NJY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfX6TLbtntvpOpO
 cjU8LpPWYTeA5g8ZLpdwUBM1qOgW692xcOuSBSTt4sJUX1pN5ZlSckyQNhH0C+G2EHue+T0oyu5
 aASRZhTgUT+ypxr7mNDX7SqVTn3N1IF61JpcRPL+T16XSr9wAO4ICBHshRhU7nyQ/f/r/e0r54p
 0frlGOUzcoD+UH0wASJmX53ELr2rulXI3ARg6sPp4cQxqhA89k/9K4Y+yVXu0WMWTCPuCZuDyFf
 AKOxvWNlZVqh+2mAckEhcmCu/52Kam2XkG1KvkuPGxVMQyqG7d/+5EUHWIYaHZPB4+OREJCjJe3
 6SK/djTHm81yX7OG6b2P5FXuCEkn4E1IIQ3yoyGmXMEQRKBkhn1Lsbq4N2c+TuOkhe1gqkCcH0E
 a/5YRzls+y72UQaReK0Rai5xjYXa3Y0q3PK9wpNFPlvcofLDvkbPnSr8CCRUJ7OPJUUY5m4Lv5S
 uWOUN+paMz29n4+nCzw==
X-Proofpoint-ORIG-GUID: 1NvOwBZyeUmjqkmFlf94eXCiK3Tso2y_
X-Proofpoint-GUID: 1NvOwBZyeUmjqkmFlf94eXCiK3Tso2y_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170027

On Wed, Oct 28, 2026 at 03:37:40PM +0100, Konrad Dybcio wrote:
> On 9/16/26 12:20 PM, Ziyue Zhang wrote:
> > Add a new sa8775p_qmp_phy_vreg_l that includes vdda-phy, vdda-pll,
> > vdda-qref, vdda-refgen and refgen supplies, and use it for QCS8300
> > and SA8775p PCIe PHY configurations. This avoids modifying
> > sm8550_qmp_phy_vreg_l and breaking SM8550 and SM8650.
> > 
> > These supplies were missing from the original driver, which was found
> > to be the root cause of occasional system crashes observed on QCS8300
> > and SA8775p platforms. Without voting for these supplies, the PCIe PHY
> > lacks stable reference clock and voltage, so the PHY never becomes
> > ready and initialization times out:
> > 
> >   [    7.303119] qcom-qmp-pcie-phy 1c04000.phy: phy initialization timed-out
> >   [    7.309948] phy phy-1c04000.phy.0: phy poweron failed --> -110
> > 
> > Note that due to a hardware issue, QREF actually depends on refgen3
> > rather than refgen2 as documented; refgen3 is therefore voted manually
> > via the refgen supply as a workaround.
> > 
> > Fixes: a05b6d5135ec ("phy: qcom-qmp-pcie: add support for sa8775p")
> > Fixes: ebf198f17b5a ("phy: qcom-qmp-pcie: add dual lane PHY support for QCS8300")
> > Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > index da83358c97ea..ab81c6e584a8 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > @@ -4094,6 +4094,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
> >  	"vdda-phy", "vdda-pll", "vdda-qref",
> >  };
> >  
> > +static const char * const sa8775p_qmp_phy_vreg_l[] = {
> > +	"vdda-phy", "vdda-pll", "vdda-qref", "vdda-refgen", "refgen",
> > +};
> 
> I think we could grab them unconditionally, as QREF/REFGEN appears
> on most/all SoCs (perhaps with regulator_optional_get so that we
> defer the correctness of this to dt-bindings for any specific
> platform)
>
Do you want to add "vdda-refgen0p9", "vdda-refgen1p2", "refgen" in
sm8550_qmp_phy_vreg_l?

What about this patch that adds "vdda-refgen0p9", "vdda-refgen1p2" for
glymur, https://lore.kernel.org/all/20261104-phyrefgen_1104-v4-2-ba508fc6ab40@oss.qualcomm.com/
Do I need to remove glymur_qmp_phy_vreg_l and add "vdda-refgen0p9",
"vdda-refgen1p2" in sm8550_qmp_phy_vreg_l?

- Qiang Yu
