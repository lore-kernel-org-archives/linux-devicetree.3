Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93CF3E1CFD
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 23:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792367593; cv=none; b=MuBU63PoQh8Txpi0N9rB2+QhV2RlwpMTDHEzv9Tz4NQ1/S93Db+jbx7TnmwAhkm5wmfN5qqwbrcFzWoHQydkKkgA9/elLCxRxo5GE51V7XQqemCnPAGqvL890fUDhOg7/lFda6kr/n6h6M0+cPR55/d6wf3ely8Uz5kDDSGfLeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792367593; c=relaxed/simple;
	bh=6g5HKqFJHy+jPg5eI51EkhtmHAefO2ruYtPIveQKssg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNFqk1JPLQ52i+EELIVzJ3LeeobepCkWUG6dK2anKum60YkxbFiHn27TO05xcZsAx9jB31HVwUT1KpJAQ4WQEUDro8zQabBAmK42njPV0NFwlbJC6I2/NUgYxhXrFqQSnmMzlX4lc4qPL+5gL0bBPcS4yD6nXT634BcViM1tNc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvdU+p5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfGYZBv7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvdU+p5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfGYZBv7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ILj2VD4191215
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 23:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p0UcZjLCI5EsaKXVYEifEeVT
	wnpPCrWb11gsbObd+YU=; b=VvdU+p5P2HVWGIS4IDl2/9rNdQMdmpu70XGjiIUY
	9xHLxWOawWeirSqftTIKVKv6NbgJHmQWMi+0W/CKA+JzhkyWi+g3cy9Sm5yCSIhG
	huY/BmDcqjOHV3qZPkCUoZWYK0ReofsIbivraCWuYwvXCwyCIFqO4Keu2tMwn6BC
	dZeYzOA5OrY51NjeI7U5h/3mByROVrnmAb5SQDm+Lc4K32xxKsBJDRTLlMuk0K14
	ivOLMc3VJYrLyTB5WhtjfhJ9p+dVs4BH62+U0afgjCtekfWdeTuLWZ/L7WBvFiKs
	xq7Kd/M/HhlIuUPFznC0Wd0+k4ZjG6xh0s78LQm1nego9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc2a9m0cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 23:53:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso492650085a.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 16:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792367590; x=1792972390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p0UcZjLCI5EsaKXVYEifEeVTwnpPCrWb11gsbObd+YU=;
        b=dfGYZBv7HXtuU/YG6FHj3A/85Kw52GTaPFEVGAnZdrCmNB8u7bi1VINRrj/1qF/3aQ
         8fTx4eJg3IIKF7aPAf/PzYd0QC6S60sYGPAU/syn5aeVhoTMax6VYwd6g1vDSpZoR03T
         OviyiwJj+Dz174yiTKU3qcMqIQo88h3cM9VMBvjiB2FODJA6WBpjJRF+1D/ojt5WaJUj
         SXusdtykdp+1qx2MLtGZbE5wd6Afuwc81TRL3xQaR/ekC3r1ScWF2su9UR+p6lxZSjxh
         sXNIqsAZckDXZx9D07kiZPNITh03Cl//9JbxyDtxso3/cPeo7ygUIhzuNnzWboHbYsbE
         NxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792367590; x=1792972390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0UcZjLCI5EsaKXVYEifEeVTwnpPCrWb11gsbObd+YU=;
        b=liBdNf4WDM5/q9wMd04pGWAymMCCx6iHf72QRJGxHF9zoPfhA36wKtYPCQT2zhuaHj
         AnjCSeXbrjsaPZe1V3zRICEqo5Hv3PytCUoJ5f3pRVGdGyxqHZKqjLtwPceTubfyaiPi
         90gdH51hDZzKztWlKuBgsVqP2/JFCuFgqDtINAfD9Nxwf6xQDa44BxFwCeSVaF2kspTE
         fh3aihyPs5UG+VoPczzKxOieCvfteldfbrOl8HP6jfRlN5dMHA58SWqcl+YA+ORCH7qN
         mGGhnGk/GJVoyWv6z2+KzGRw8bRpx3l51PJyUwAfmHT2b4gh3nX2NHuPP2pTVfIhr44a
         IuBA==
X-Forwarded-Encrypted: i=1; AKwUvBz+gacn9VBNhDeIueicuZWNAwmEMjybLzdVCqGEggLtCWLKn4lrrNGPVBmzII4otPcBvgJ+phI6ipUC@vger.kernel.org
X-Gm-Message-State: AFq9FYKiLi/x4MOLBII4u6/B1w4M/VBHJDefssapQU+97n16O+xT5iUO
	6Pg1vLNJjiz7hdVbq/B9U2yyw3v9nTJQr8vyxz9HyB2Dk0FPg8uvU2HJ2C4SVtEhoUchfTg03GO
	iwWknSDQOFSQrW0g0XkAddnOGfSFWHr+JvHTPikExfg5O0E+LzEepgojBOkuaovvJ
X-Gm-Gg: AYBFou1ajJV/l3EeeZtdAr6y0NM4EpXtsi84127j53mw+eGqn7AqKZ/2tc1W4/a7+us
	IEMWxMjLSdotUgNYlcW34vqq4ixcQcIWpiMc9JNW3/Ko6NH5JJHlEfi/pgLTjpVNkFBUpdj/hcr
	jWarQ1tBD2Dpg9obHu7eXjCk2VkfTKDJtgZd8qhKqUh5ybYPfwaXgUZ4FdnTpTlNzsPMQIWy43P
	Y4XKQIXTURKjIJPbjNktYaiRG15vZlaOc6gQ+AAltNw3mnJwIWQiyvdWK8lLnci1LKpehZfucPx
	2+TrNgU02Q0uPW9IhD6qxvWj4xYKpUl3zHzsa6s/ky3INJgCtSTjDI/1HCW1h41GnXfwA7kG/be
	ZK3yVFoNo1ewF18paSNqtbW1RkjA8jNsuDdUF3dVP75C//osRSfDBrmZzuVvK3m3/Lhfn3L3cJU
	QgyCfLvpIbHq8f
X-Received: by 2002:a05:620a:a181:20b0:93f:2479:2b4 with SMTP id af79cd13be357-93f247904fbmr734310185a.10.1792367590080;
        Sun, 18 Oct 2026 16:53:10 -0700 (PDT)
X-Received: by 2002:a05:620a:a181:20b0:93f:2479:2b4 with SMTP id af79cd13be357-93f247904fbmr734306785a.10.1792367589543;
        Sun, 18 Oct 2026 16:53:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm1616881e87.14.2026.10.18.16.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 16:53:08 -0700 (PDT)
Date: Mon, 19 Oct 2026 02:53:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: David Heidelberg <david@ixit.cz>,
        Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
Message-ID: <eodzuccugtdn42basgpczett4yatyirog4nxwe5rhg5xf46ibp@jzcjmje4aqc3>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
 <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
 <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
 <5c41ef43-a065-46e3-9522-faaf3884b487@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c41ef43-a065-46e3-9522-faaf3884b487@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA5NSBTYWx0ZWRfX6vsSszj1d8he
 IuhGv9ZW4K/BRpFXx09d09GWcOVVZwwIR5JZ0Cezi6r5gIvgs3BHd+pUnhSsNhR1MWezDQWr87I
 GDDYn4OfsuqImQgwAFaZbAvpO+WqxAg=
X-Proofpoint-GUID: pp77zneQTwRL_rbdVf0DZ0U4DLPHzRL6
X-Proofpoint-ORIG-GUID: pp77zneQTwRL_rbdVf0DZ0U4DLPHzRL6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA5NSBTYWx0ZWRfX2z1+QT+uts8V
 s4/uILtU19Q48ymjWXUPTT6UAJ7dzs0mB4S/PVvna0v1m5kxjB5WzH7FbRSb/JBUOlKAYryezbn
 6HgB6xrOSByViF/yopNIZqr2LkpHjSjcKGlxhIMyhuj6NPtaOL8jZJ9cCLeDsezByIBHnI7Kf+6
 QpKSaFHFbj5U1dph6SR7Y+eyqz7m/oHdGbaGjbiBNSzoqxqIqOuJclRsaXqB5sYTGIB44ZtWMmn
 Opvq+VHn+gGc9jwjM5Yl42hqF3MLH7ib5da1dboJABy/+82zRS5Z0WQzBiGG23A0v0hDTu00CZ7
 44B0ZBXOAM3OUq1eykLotFY5aYPCefAFyYQc0C+aVOb0WBnMCS+soZIRI9Iv48xUrO9dliiE1Gg
 qp7FI96mgzGBI8eJJgYGT62hK6UlZ72F8k/wI644ZNOWG6rPtkhucn/PC2UHKbvTDSKun3YCeVh
 BogplctJmZbx1U3rNJA==
X-Authority-Analysis: v=2.4 cv=PMeaavqC c=1 sm=1 tr=0 ts=6ad55be7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=3RZNE-nbyhM6VGf7PbYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180095

On Mon, Sep 28, 2026 at 04:54:08PM +0100, Bryan O'Donoghue wrote:
> On 27/09/2026 17:33, Dmitry Baryshkov wrote:
> > > > One major comment. As we see, on SMB2 PMICs parts of the Type-C
> > > > functionality are provided by the charger / FG device. I guess that on
> > > > SMB5 PMICs we will get the same problem once somebody tries to implement
> > > > additional charger features. Would it make sense to rework the PMIC TCPM
> > > > driver to be a composite driver, taking several components via the
> > > > existing Linux interface?
> > > As this gets decided from the QCOM side, I'm fine with whatever suits the
> > > hardware best.
> > Bryan, as you are a maintainer of the PMIC-TCPM? Would the use of
> > components be fine?
> 
> I mean maybe. Would it not make more sense to land the TCPM functionality
> and then look into adding charging moving then ?
> 
> i.e. finish off adding this piece first

The problem is that we already have SMB2 charger, which accesses the
same region. In theory it is possible to say that USB-C driver conflicts
with the charger "for now". In practice, I think, it might be better to
sort that out from the beginning. You didn't have this issue when
working on PM8150B support since we never needed charger for that PMIC
series.

But, then it's up to you and David.

-- 
With best wishes
Dmitry
