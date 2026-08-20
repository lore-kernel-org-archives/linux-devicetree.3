Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115314052D1
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219148; cv=none; b=EV6IyTNAuf/SV2IDG7QZQ2DnIgtSEsLrR72Wv/iBCSUpyH5o093Hp84wP+u7idpQT8rhq/X7Vb/W8g4/PgSxf3C+NSHBJNlHTepPJahf8mTkGtuVPKZKEQwQtLzGgwiIGtFoR2eW7o6HIvi4gGk9wx1sXyLHCRtUkFLF0lRIqWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219148; c=relaxed/simple;
	bh=F161C/DF7UsWl4q0rXRwFx+clFgLr4p1LFk0d0V9LXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdU+lUNUi7an+cPtMok3v1VK58ZVHXT3YlgmhdeyPO6MZuION38N2k51uEhn1PFbmPOlXBuS/nu88cMcce9O+bu2RvFQDJaxeSX7RdGMtBk1WSPzKm/wOH782O2rt923TliA7t2pEjmCfZcD42ZEkZM+hZCZu05P/wDbjWGKaEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/aYZdNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcyvdNY0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/aYZdNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PcyvdNY0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6E3H1490799
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mwz10jy+CVBwE4oPoSVTPynJ
	KSyyVze/J1ci64l4CYw=; b=P/aYZdNyKy5urz5ckFVsyBRjyUkbEhyB509oOQR6
	19BR2BqgdBzDTqPH5wWczlg7Y9WkWV+Yjy49uKqWDdhK0zkAPE99rbJeffSpXSLu
	MLb/V64ACes/DZf53qLeQE6IE0qfBceHoVzpQXCWbVl8VH5/Lx5UZaY2LsT1Rp/H
	fWw26lHhGchrlXA5kfejmeTQj6EIvajxYRv+P4g7IeWIODTx+E1UyGeYtNsdBq8e
	XqrgxNv8DgUGbcj4uUFzGKNMs72V0VSRmbp4lcjPwOpe4mPg4BmqhkxiJW6ww8YV
	hcuQeZcDyX25ZfqHGNC4bHkYF+BLelTj9tvmQ+vU92tKIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervm96n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:45:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e695a3b28so83580085a.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787219132; x=1787823932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mwz10jy+CVBwE4oPoSVTPynJKSyyVze/J1ci64l4CYw=;
        b=PcyvdNY06TcXYosvuMbha1kFXWVxeEvnENjYg2D0vudubM1xd/DBn1SONzSQ6IB1RH
         bFNxuDxa7ajZWgmTdpTNBi3dNG5IjRAoJMyclTc58Rb1daBDZdpmX0tINFaHHzIxYSZs
         D3tARZeaq8sKU6p/tUmILLoTDprMniQrXAo1G63OGSFs41WX4KbNvjCxI+SWzCi8XxA0
         SFJv71Go9KmDHRCYtthJlsVQ6iRzcRPlccQxq/2JWCygVmxumPBX33oKUfwsaJJtR7XF
         5pewl/hJWFPJhwlJTiMxNmWh5IjRsJ9gjfSfFhKY/lLgdngxwu/vZ1FhPeW6cUgju2bt
         Bydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219132; x=1787823932;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mwz10jy+CVBwE4oPoSVTPynJKSyyVze/J1ci64l4CYw=;
        b=Pp7PavyUVD642pCiaQcZPgF+XSXR3OP3qJvPy+lMatcqSfv4CqwoTt7zOz9DcGJeGw
         GH9xug3gk2/SIKXeAOLKslEzhHMEk9UUwbn3f7jwnshDluJUbLpVf67txAqXF0nGqLZY
         ZfkqiUkQNGFGRIQOdpyNgKJroJZXNb1Tnr4P1MC3OSgYUQu42Yf3vlSzy+qIrfZ593sI
         t6JMM5nr2oE2rRqJznsuPwjRfoghTOAADdtXj962qEyKi3GPD8AoFrhVogDY6bJthNgO
         7xTv1N9soizuI3sPFVL9+NIhAvy5dH7qmL62YsdG4FrojgV4HabMtt9rfRbSob0c6hFk
         cDow==
X-Forwarded-Encrypted: i=1; AHgh+RrnedB/PKQAk+ZLZG6LgqW9umUx/iwH2E4QeA1LYIxNCO+PBIp/ekU/kdiW500M+fQ4s+axaWjP3FCG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/99CJiC8NBEU5nOsmI3lR0S1mltDUmLpamQGZF8rnVzIqmLT8
	S/0XW3LCMAL1e4ii5t7nbSRrPdnptw7g4aPSJFCR9ExCjRtUk3h50IXRX7VSzlXepeStPG08nY4
	ZaKglF4J3Q2MIbDdcigPD+Jb/Nbjm4lYcOU47e+EMuo/xjPM6c/BvcfowPsqFUEhI
X-Gm-Gg: AR+sD10+EiYK5voQnNdADlEqh18dYWNZhZwpG1xXf61WPtZ8zHnJJwF8xTKFbrwayDb
	rUbO7OXhgQYg5WfClVAYUWXt61RRwVmU9gT6npk9kzl51CVv2BU91GqaRY3h0oDMEpi9fx5PBpJ
	HQdAtiveInLb2jWLHEPyXMeFOH9GUlI09aaFCNT5c/ngyveG3RJMRcKWRDBV6NfMEGCtDXlWR6u
	W0uPDDtcC8SEWTn2+ybG3X8kycMuVGHg5+jta6EHudyF1MRI38IpKAqTNtBSLZTCuwhqjF7ftEH
	uq3iHEDdg+b49MQC2jNk4Vyon3memBsRMCltNHe0Mijpcbx+VFuvWHM/Iv77vW/cf5a7FQr4c7L
	oU57M3gsirpTrCXY=
X-Received: by 2002:a05:620a:438a:b0:933:ade:2daf with SMTP id af79cd13be357-9372852ccf6mr525662585a.18.1787219131657;
        Thu, 20 Aug 2026 02:45:31 -0700 (PDT)
X-Received: by 2002:a05:620a:438a:b0:933:ade:2daf with SMTP id af79cd13be357-9372852ccf6mr525658585a.18.1787219131095;
        Thu, 20 Aug 2026 02:45:31 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17fc80sm143880535e9.14.2026.08.20.02.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:45:30 -0700 (PDT)
Date: Thu, 20 Aug 2026 12:45:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
Message-ID: <dolyrylefweb6mwiingm3rh5ledf5x7mxngfho5czrvcymfpcx@lkntygnphbht>
References: <20260820-shikra_dtpm-v2-1-bc6698564ed5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-shikra_dtpm-v2-1-bc6698564ed5@oss.qualcomm.com>
X-Proofpoint-GUID: FqOxp2bqZqhfPa2IX4xw4mhzk0171jjD
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a86ccbc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VPIKziwejObZ-StCHZ4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3MSBTYWx0ZWRfX6o3kV0qVcxLw
 C2yQ4xwgfIiT7MADgnbTu9HuWrd9vQZs+Sn8J/WBcSTh6AxlFJdnQOwl7KCyggccEsx7UK9J735
 nRBUVq/aMAIlMOXMU8T6uzf1Gf3Pl/9AZ0xulE+00sVOLnmy3TRlQHSFjVKO2IjgNrNb1zKzOnf
 0jduYokNMb3LcwXsNt5KtY0JfE4S5sdY9AvuBNXfZ+SwqVdYUFNDfgOgCYIl0rw+FiUHi/U2zXd
 JdG3rHbcr8dLwKlnHR6AiaL47cw2hszqz/2AQJxIV1k4Z09qtmohT5LlSl5ZvyecjIo9Fq92S+8
 S1E/iBpnIm12ATGCXxflopSGI8LLh/li+m/3ZEeOogIAfqbNTlkBB7EgapxUAfXcOLHsV5QB1VE
 MfZQFXlxIYQpCNXsfyKEoJXlq97Uzp7oIzqev7sJnO4ubu/Y6GFGbVpAQU9aFZd2yAVVkIqIivj
 yOnSl8T/q8hBYl9CnxQ==
X-Proofpoint-ORIG-GUID: FqOxp2bqZqhfPa2IX4xw4mhzk0171jjD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3MSBTYWx0ZWRfXx7551IijFHIx
 1PFYmj04c41G5/PD3iR0oSvsmwIokOPSde0glDW16Ptpz4QEH8DgFZgQSZF/4yVDVszEjuPPPaW
 6XIlZLUz8ncOk1yqA+GAAwuCvYfDQAY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200071

On 26-08-20 15:08:00, Khalid Faisal Ansari wrote:
> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
> connected via SPI5. Enable the SPI controller and add the TPM node
> with the ST33HTPM compatible and a 20 MHz max clock.
> 
> This change requires SPI5 to be enabled in shikra-evk.dtsi [1].
> 
> [1] https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

Please give reviewers some time to review before you send another
version.
