Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FBE43CEFD
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050809; cv=none; b=bRfYw245XOmmWXu8e/fccMtJIBDwjMh7raMCURr3x0ufq6HxQh0nEnl4Lwgq1rrHPeV0jgJitrAFQXAtn1q0BCf1y4oCxc3S2AA3gccSiTGG0vGTUOexgyh8l8iPkvVkzQOFtPp4TGcvgxnw6HPyUtYFenAXo2NbQEkk3JrZxE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050809; c=relaxed/simple;
	bh=Lg85m4tXxOn0+aHB//mcZAgObaEYf2ZxGTjmLeHnESE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mm6bBISdcTLwp0hvhavCa/LDMxzJjYx9a4DcMUazYXS4W1TMVkaTHC5rdejSBZ65ilyhkszin+7V420PYsLtFnfTY7Z7O5MDit1gJ8g/4tcWZwpmy/DwH9LqZ76ggL0OtN365tXqaf/SYQ9MBMl9wl63sPja77TUcUCc6lviZEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P50ugeZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGtfr8HH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P50ugeZ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGtfr8HH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631Crp071578381
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 13:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fM6yG3SOaP5F2rQJ4EN2ak+P
	lwQbCFS7X8DdkSKQYIE=; b=P50ugeZ6MBe2eRriqxke+GNGehjiREcJeewAWNgH
	pK1x8ohcCyd/rUHvSq7THuhkWwTFLq/Iu6whJT1nwkw/3Z0EoIrupn015R+NuwWN
	6Nykw2jq103HOFxEIXbBBkolObmQHzW5RssZJQ+VYhkcMIoeIVySh0MPsrvmLeyb
	ZUnpjw6j1JFW/DX/RwF1LIXv1JbFOK3lpRJ9Xd4gteQE8bCW48vmtqdLkKLvLiYy
	4qsuYuZrPjNez4biSKyE1rIBg23K2NWViXk8g1KycKFyaMznh07wDT/GBy2haPro
	M9RYdAfyWYlRQATFzjzWzFVG1gyetca6JIXiP9V9jORHtA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8k6kvax2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 13:40:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso85825871cf.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775050807; x=1775655607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fM6yG3SOaP5F2rQJ4EN2ak+PlwQbCFS7X8DdkSKQYIE=;
        b=CGtfr8HHx6XTmEN6p43DfYbD84BMC030w0MKq0csa6bUhMZF3YO6kCRzt5I5HQ2Bg5
         XWprkH3WChbe2F9X7/n9LbPu8mMqu6K8s+oIYshI0zQM3cgD5z3ZPmAYVlyuhuvy1o5v
         HNg6ABgnTdQMqMG9HthMUYPPzV3+GMnTAVFCwPYgEjFzdahwA+hqajB+VBeOQU7uJOvS
         aDwX/QaB7eJ4XX99w+wk3I3puyBeHKYS6rb9SLnNacn2mHVXOIoL+sPKw/kf8JwpmpSt
         URnHXfwHDX/Fj8oEB71ScQnteazB6J2XGGf6ZUhQWdOrGu6iAhm3FhfZvppL66v5UcCf
         jifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050807; x=1775655607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fM6yG3SOaP5F2rQJ4EN2ak+PlwQbCFS7X8DdkSKQYIE=;
        b=moEvwP3l4M30/V9wUIxGmhagf+5EyRlVZof3tXe7NYJpcozPIHIttgDWZeWD+qM6cc
         FRR6ucAswMHVsz2SIo1yN6ziDIjZ8DheWohtqznCCR/c0OnbcZYdI8P0d/gL/pEacH9T
         Mgevh0dubLk8nTJ70Nmma+Q24wz6gp9j8HnhfC/OYuxByxg3mh8T49dzdunj0I8ZOeF8
         Bb2ZQK5eoVqEKG929nmoKDQfE587vWU+A2BAe8VCZbeSEMKTcDdcNzYU2cL/CtvTzzO8
         lSTpHYuRbVSrXZv2D4kgfQfrWqoXa1wvMPL9229lBNwwtjao6jL41uToRo1A4D+ZYqWz
         PL5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5f/cLa4HzBKEhTF+8317Ig+M6hpj5rlZw3ncyWYEp2Tfir6WBObhlv51oCmt6ojmfq08cAm2yjPHP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/4D0wI2XEGllbfMeS7Xbt+F125yuJWlqbW3BacyGPkQgiTKg0
	u7b7FBrG+lPtqEm/0rKlT1+jz1MQZ8G1GKBzt6k7ppnkIAokYPRuDhIBLQfK1FEPtLdNu1vc1WD
	zyMVkrkPmzPOVwT5vOGTFvxbbmjoiQOK1H4cfwIjSJG4IgK+jyaxRKQWVmQh4NpM+
X-Gm-Gg: ATEYQzzXNCztaMON2HmHBSYTsTCLv2olgYY1MGrCtdqQN0/txLJinr6CH0sKj3EJar4
	jMf6MY+0l4b9QR5BWeYUQEis3hbEt3SeKrL9KhhyiTbaRI/hwqOyxKq7Ves01Hq5TpywFiRlxP9
	DU4qdFAXYpYOhUEBYCDA1DZEEsERKBbuKzBv/brAi9HkKiGqLDyF2/wzrLrkEtbF62Y8t2aw5t2
	I+qyogxB9VBYcf7JyD89TooBM4Uek4CQMC42qbn5ji1wzWD0UrKLacclB+21oStq5yLVYhImins
	+FUQXBRF8wfooBGaAdZH2yaET/xkMAruegBebGqTAqQ6gDdsQz+gW4/MWbYwcIHI4Lq6Tbd8ytx
	g6ESDaoYpbVN0Muuk1hHE6lvrswwVQv2DpJqPfH+TWI8Ik0PIigfhGs4wPndNsasUwQwfGee/MG
	7hbm+OoTQKHDtSzwUCwFngZZqe0xEXSMER0H0=
X-Received: by 2002:a05:622a:a0b:b0:50b:3d1e:58ba with SMTP id d75a77b69052e-50d3bbf72a5mr46841521cf.28.1775050806491;
        Wed, 01 Apr 2026 06:40:06 -0700 (PDT)
X-Received: by 2002:a05:622a:a0b:b0:50b:3d1e:58ba with SMTP id d75a77b69052e-50d3bbf72a5mr46840671cf.28.1775050805835;
        Wed, 01 Apr 2026 06:40:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c419b631sm495441e87.52.2026.04.01.06.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 06:40:04 -0700 (PDT)
Date: Wed, 1 Apr 2026 16:40:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v7 05/15] arm64: dts: qcom: sdm845-lg-common: Enable qups
 and their dma controllers
Message-ID: <pnnm7beyy7ef7buy7kdg4prqnuuv2rrxb7xxv2aemcw3x7tqbo@kx7ndapf6ub3>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
 <20260331-judyln-dts-v7-5-87217b15fefb@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-judyln-dts-v7-5-87217b15fefb@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=bfJmkePB c=1 sm=1 tr=0 ts=69cd2037 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=Gbw9aFdXAAAA:8
 a=EUspDBNiAAAA:8 a=4a3UZYCyxYPj_-8OAHwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyNiBTYWx0ZWRfXwiFWCaDicL2L
 ijcKN97XE2/+EplBNQntwYbCD2w/8mP6R3UKsdKtxI0Ozshl/x8vRX1s3PIZp0WQ2TJoydwyEx4
 dKL48M7s5nYqB25gTcYoOrVd9q2QQTTHW3LdG2v3fGmRX4o1Wm9k7vNKT8l6Va/G6I/doEmpykk
 Em2UuFnRm83f7VSkHYfNsomgkXJohTWGQIyN44EMI0DMP/5NhL7xgSXhUTJtneWHgwgZM76Rq/o
 STZ32IhhZEOc3O+IQDWy9fHqznX0q9lKzLFA99gwVITBoCYJ6bSCm+15GkcnityQejTktIF915M
 20YRUvFlpw2WGp0cCT1OzbouoXp43HDgAjweSBFByUXC8Yrb+/UyEuUPmA6wuW/SRSZW7w8b2K3
 C0w6rLD5HR6k9AsOl3V5wpt9vFzARgpV77nqIqhqS6qfYecZooA+ShpnK/rGAR0VfTfp6tHBvZI
 jaCxlYEG0gwSNbc+yNQ==
X-Proofpoint-GUID: 2pZPgkZPaIE4TqOWhy6NB3I8xDpL6YYg
X-Proofpoint-ORIG-GUID: 2pZPgkZPaIE4TqOWhy6NB3I8xDpL6YYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010126

On Tue, Mar 31, 2026 at 08:15:10PM -0700, Paul Sajna wrote:
> Qualcomm serial communicators required for i2c, serial, and spi
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
