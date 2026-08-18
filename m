Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E70440A19
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053110; cv=none; b=rA131kiTZ0XlScam/S4LMD1cmz86jTVsb3F/C83QKqmpUbgpDEdMGGbL+BbrGHBZmpszgro+BCFLgI1Y0ZQ9HL5tQbfYgsAYYVmu5V2Kkw1hhEr1xotrRN0olTlVEBtnWNsV0xd9RhrUN3HS+DZbzR2LD2x9H6tSLj0ZrLAjCwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053110; c=relaxed/simple;
	bh=q1CGJCRAI/H/kngkPmKzYnqyLDmlvmjfGxSF2tr6aTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IU8qDdDegAUOYpmnY47IK5KaDY7vf9CQetMmlZwTKT2Xo/Y92HwpzClV36OYAb5Cz/AtgTueQZkD66C1TkCqRprBPIwqRdiCdyIDPq/CgS0nxkgZC6quvJV/8mfJB5KkSmND6TgCumRw7q7YhLt+YYa38Lmb0NNzFJ+rrluF2Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lk+NAF0L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tek0FcKj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lk+NAF0L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tek0FcKj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABZDX3979120
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ncYNu2KRJ/Tha91GQijJqGFI
	1sxsOUm6AvNieIht+IA=; b=lk+NAF0Lw5QWjWuij4iejIkPF2SY4V2TZnM2QcVP
	mUIH22UwZozyzLs6rtxPZIYSvWZFyjDw0xOrrCd3nv79rMQ8b1tu54jEwDuyhxNe
	yrwRZ69XwCKRuhrN7LVOQV0geCg5a4tXUDr9Deszx7/QE2ZpwOi8ko+rxeIu8i9B
	2VN0iXzFSdTZ7W+2/kJxCw0WfvYZwE2kjGEri7mdbqIeHQsQkENzdSnr/MgvHJQR
	zSbv5epVl8GeWGVRI7iIBDJjuqHgzbD5AzbfDQUtjCDJRcSsilHHhKnVLKtDR48w
	EW6Yz/0pO9RInCgjipw1ord9nOzi5ybMbUy2UBWnYlQ/Zw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpt7ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:38:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934979ee9f1so588236085a.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787053108; x=1787657908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ncYNu2KRJ/Tha91GQijJqGFI1sxsOUm6AvNieIht+IA=;
        b=Tek0FcKjy7CLeU5jNNDwzTkDlieBYyAjsDqqZn4aQTSkjTAo6QlJpjTxozj8gt/3Il
         vAQuFuJwk6LfokJu2Z0WxJtC1YnhUU9gtID99sU5kOelvKbI1XoaMLgdxCaymcyKJ9tY
         hBrrkwQ4BKLUG3iYSJWOJZLg42crT5UGVUFgej9S994UneKY4TXbxI+Gth9IBSO0uu9c
         XHbpmzqi5dz6q+4ZQYuRRg6r4FdjuBFTeYBaHY15DUQT+bTGcnMikMQxvxcQLLdiy9we
         mmyV7Xu1PT+H6y8c57tIdx8M+Qx5zFPa1wkflj81G8CiE7H0OEs726ugyQqkanGF5Fzf
         bgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053108; x=1787657908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncYNu2KRJ/Tha91GQijJqGFI1sxsOUm6AvNieIht+IA=;
        b=kwC2XUpLwx4bJPQVjDukteGL5E3JHfH0gx6lGIWWCCQY/p+o3mtt+Bk2gEiqFyvaB0
         ycRxmGCzSzOqE8EIdriU7Wv5NCY4+QAwllTzvGdeC9PHGzNe3/EC1VJtrUZlxqF47IeJ
         5a21BFXtbYBUaw4veK9FG5WraaOtNyDwQjL/WIIR04nPxfUd5uuOrep82zbJai9GoGKb
         uLWY+8Dm1sTHXDZG/8u8L21WBBbiNJfWA5FDwn5yNsX9YdUFgHNG0rhvGPY+yy3nPn2r
         A09/b3v45RrZk2YktlPiJ6GLs/XItRlMGCDStdGIQquCBGbLdA6yvHfhQTeFVzdBsUkR
         AErA==
X-Forwarded-Encrypted: i=1; AHgh+Rps2eYmKJ7FP/iZCG+fBGCNf/H2Lv9gtXQnpnKlYnAv8Gv+HUdBqGAeGpx323E9QYKh2PzoUHyuZulT@vger.kernel.org
X-Gm-Message-State: AOJu0YyKhag/KDniyulJ/NI3h+GYhe3DfP/cOGAZWrs5mGJDN0/EqzAb
	xf8Hg0YA4iSoa7zFoCYb/n+o2kzJO+kwdAyGA4he7grBz1L19x5O9W4vvgEcoJKkX/2h+MBkBj9
	06seoV2go6L4n4hbtd4mUsQoGM+pd5BRKBGzldH7yQyI4SumRa3H5KcoorY/Bu/Tf
X-Gm-Gg: AR+sD10td0dche3HkSf/owPj0MONiIOGKuz8p2htzAQdwU9PsUnNLjKIF2CQbzi7pj9
	SUx161FVaUqx7bLHyz1/aAwebS4EgBIwmErDMK+Z4lLgzLZ1Xqv+Epd+a0gup/KkMrvdfQbxn8v
	KORUveV00EhF91nugTHhlVIZAHg+wWK9b/6q3FaHkYtHEDha+OzJ8yq7Ywt4XGozaGQaDBrBKdP
	RkvUdFh1EkFaPuLaINnkBSiTjXE8VgAPDgaEiPXp4jZOp4UJtVx/iIw9BIDOdl45EN7oR8vr7NG
	5CdtKfpt5akQbydSrviJCgMAFLubZcxLM58g/uwZzaq6JmmM7OLAqTcCgyuoQR07mtULMkm14ev
	9OVsrzC80D1evzCk=
X-Received: by 2002:a05:620a:a41c:10b0:912:bd42:b46d with SMTP id af79cd13be357-936d22e4635mr2503447185a.25.1787053107817;
        Tue, 18 Aug 2026 04:38:27 -0700 (PDT)
X-Received: by 2002:a05:620a:a41c:10b0:912:bd42:b46d with SMTP id af79cd13be357-936d22e4635mr2503445885a.25.1787053107231;
        Tue, 18 Aug 2026 04:38:27 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996188217sm541292715e9.13.2026.08.18.04.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:38:26 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:38:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_tdas@quicinc.com, bmasney@redhat.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: rpmh: Add SM7250 rpmh clocks
Message-ID: <7mh5tesovuk5qo6ebxhz4k74zwg3nx5ab2zibtqf6o52ybdxq3@v7urixq67lsb>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
 <20260816131646.10551-2-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816131646.10551-2-sreeshankar0910@gmail.com>
X-Proofpoint-GUID: 6auuEdh28Zltz1nCUwjnIXlXG0lzKkxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX28r8ORPsv1NB
 witg9ZjLwlBhbSpebWSoi9GwfVxqtDycpdB3jm959ePsMUyHXdUgr1PFkz+YL2FpWOKA4BV2Ito
 52eXoa65W/3VfBo1hGmbHIshWX56YfQcAuEC+FZc8ZpjKtvlK2gR7F94sgWCeATSudCZpsdemic
 lETia80TpLgNDHTf+3m9DOqO71eBDcOim+M1UxA+XudQ24gGVrofG1zgpeqs+AxpNuNkShBF5NF
 gk1cQGQTKEHUKbFEmxugZN8NfbxLXQLhTEH9gCoZPTeuNLXX1g9xrglkOdSAaAbLTYiiGWnQ/f3
 VRSMKQwKoOgx+OEzCLJFXfi6B1BbMOM2XlUtcYkWRD6UsvNEeLQQ76bhDoJvRP6pqveVqvwvZoM
 4XykoMcLvRIdOwnuG8sMtIl2q7hzJeO6UhTczqaBmglq5C9/cN8NqQOs/J9WLp+rQnfCqfN5Zga
 2z/Cyd/5SNfcyjEV6KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX79jfmT7I2FZh
 hABk2ZBwdhakg0jDKloKP6Qc5nKXupbakHq6VO3zctPGUrWs++X7/6CB7+CYzwUwQvskEDIQpA+
 LTblNOt/NzKWFt2tFtCMqbDdQ2hy/R4=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a844434 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=Z0LeWUw4VpMA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 6auuEdh28Zltz1nCUwjnIXlXG0lzKkxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180085

On 26-08-16 13:16:44, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
